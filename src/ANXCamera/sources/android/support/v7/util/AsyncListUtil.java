package android.support.v7.util;

import android.support.annotation.UiThread;
import android.support.annotation.WorkerThread;
import android.support.v7.util.ThreadUtil.BackgroundCallback;
import android.support.v7.util.ThreadUtil.MainThreadCallback;
import android.support.v7.util.TileList.Tile;
import android.util.Log;
import android.util.SparseBooleanArray;
import android.util.SparseIntArray;

public class AsyncListUtil<T> {
    private static final boolean DEBUG = false;
    private static final String TAG = "AsyncListUtil";
    private boolean mAllowScrollHints;
    private final BackgroundCallback<T> mBackgroundCallback = new BackgroundCallback<T>() {
        private int mFirstRequiredTileStart;
        private int mGeneration;
        private int mItemCount;
        private int mLastRequiredTileStart;
        final SparseBooleanArray mLoadedTiles = new SparseBooleanArray();
        private Tile<T> mRecycledRoot;

        public void refresh(int generation) {
            this.mGeneration = generation;
            this.mLoadedTiles.clear();
            this.mItemCount = AsyncListUtil.this.mDataCallback.refreshData();
            AsyncListUtil.this.mMainThreadProxy.updateItemCount(this.mGeneration, this.mItemCount);
        }

        public void updateRange(int rangeStart, int rangeEnd, int extRangeStart, int extRangeEnd, int scrollHint) {
            if (rangeStart <= rangeEnd) {
                int firstVisibleTileStart = getTileStart(rangeStart);
                int lastVisibleTileStart = getTileStart(rangeEnd);
                this.mFirstRequiredTileStart = getTileStart(extRangeStart);
                this.mLastRequiredTileStart = getTileStart(extRangeEnd);
                if (scrollHint != 1) {
                    requestTiles(firstVisibleTileStart, this.mLastRequiredTileStart, scrollHint, false);
                    requestTiles(this.mFirstRequiredTileStart, firstVisibleTileStart - AsyncListUtil.this.mTileSize, scrollHint, true);
                } else {
                    requestTiles(this.mFirstRequiredTileStart, lastVisibleTileStart, scrollHint, true);
                    requestTiles(AsyncListUtil.this.mTileSize + lastVisibleTileStart, this.mLastRequiredTileStart, scrollHint, false);
                }
            }
        }

        private int getTileStart(int position) {
            return position - (position % AsyncListUtil.this.mTileSize);
        }

        private void requestTiles(int firstTileStart, int lastTileStart, int scrollHint, boolean backwards) {
            int i = firstTileStart;
            while (i <= lastTileStart) {
                AsyncListUtil.this.mBackgroundProxy.loadTile(!backwards ? i : (lastTileStart + firstTileStart) - i, scrollHint);
                i += AsyncListUtil.this.mTileSize;
            }
        }

        public void loadTile(int position, int scrollHint) {
            if (!isTileLoaded(position)) {
                Tile<T> tile = acquireTile();
                tile.mStartPosition = position;
                tile.mItemCount = Math.min(AsyncListUtil.this.mTileSize, this.mItemCount - tile.mStartPosition);
                AsyncListUtil.this.mDataCallback.fillData(tile.mItems, tile.mStartPosition, tile.mItemCount);
                flushTileCache(scrollHint);
                addTile(tile);
            }
        }

        public void recycleTile(Tile<T> tile) {
            AsyncListUtil.this.mDataCallback.recycleData(tile.mItems, tile.mItemCount);
            tile.mNext = this.mRecycledRoot;
            this.mRecycledRoot = tile;
        }

        private Tile<T> acquireTile() {
            if (this.mRecycledRoot == null) {
                return new Tile(AsyncListUtil.this.mTClass, AsyncListUtil.this.mTileSize);
            }
            Tile<T> result = this.mRecycledRoot;
            this.mRecycledRoot = this.mRecycledRoot.mNext;
            return result;
        }

        private boolean isTileLoaded(int position) {
            return this.mLoadedTiles.get(position);
        }

        private void addTile(Tile<T> tile) {
            this.mLoadedTiles.put(tile.mStartPosition, true);
            AsyncListUtil.this.mMainThreadProxy.addTile(this.mGeneration, tile);
        }

        private void removeTile(int position) {
            this.mLoadedTiles.delete(position);
            AsyncListUtil.this.mMainThreadProxy.removeTile(this.mGeneration, position);
        }

        private void flushTileCache(int scrollHint) {
            int cacheSizeLimit = AsyncListUtil.this.mDataCallback.getMaxCachedTiles();
            while (this.mLoadedTiles.size() >= cacheSizeLimit) {
                int firstLoadedTileStart = this.mLoadedTiles.keyAt(0);
                int lastLoadedTileStart = this.mLoadedTiles.keyAt(this.mLoadedTiles.size() - 1);
                int startMargin = this.mFirstRequiredTileStart - firstLoadedTileStart;
                int endMargin = lastLoadedTileStart - this.mLastRequiredTileStart;
                if (startMargin > 0 && (startMargin >= endMargin || scrollHint == 2)) {
                    removeTile(firstLoadedTileStart);
                } else if (endMargin > 0 && (startMargin < endMargin || scrollHint == 1)) {
                    removeTile(lastLoadedTileStart);
                } else {
                    return;
                }
            }
        }

        private void log(String s, Object... args) {
            Log.d(AsyncListUtil.TAG, "[BKGR] " + String.format(s, args));
        }
    };
    final BackgroundCallback<T> mBackgroundProxy;
    final DataCallback<T> mDataCallback;
    int mDisplayedGeneration = 0;
    private int mItemCount = 0;
    private final MainThreadCallback<T> mMainThreadCallback = new MainThreadCallback<T>() {
        public void updateItemCount(int generation, int itemCount) {
            if (isRequestedGeneration(generation)) {
                AsyncListUtil.this.mItemCount = itemCount;
                AsyncListUtil.this.mViewCallback.onDataRefresh();
                AsyncListUtil.this.mDisplayedGeneration = AsyncListUtil.this.mRequestedGeneration;
                recycleAllTiles();
                AsyncListUtil.this.mAllowScrollHints = false;
                AsyncListUtil.this.updateRange();
            }
        }

        public void addTile(int generation, Tile<T> tile) {
            if (isRequestedGeneration(generation)) {
                Tile<T> duplicate = AsyncListUtil.this.mTileList.addOrReplace(tile);
                if (duplicate != null) {
                    Log.e(AsyncListUtil.TAG, "duplicate tile @" + duplicate.mStartPosition);
                    AsyncListUtil.this.mBackgroundProxy.recycleTile(duplicate);
                }
                int endPosition = tile.mStartPosition + tile.mItemCount;
                int index = 0;
                while (index < AsyncListUtil.this.mMissingPositions.size()) {
                    int position = AsyncListUtil.this.mMissingPositions.keyAt(index);
                    if (tile.mStartPosition <= position && position < endPosition) {
                        AsyncListUtil.this.mMissingPositions.removeAt(index);
                        AsyncListUtil.this.mViewCallback.onItemLoaded(position);
                    } else {
                        index++;
                    }
                }
                return;
            }
            AsyncListUtil.this.mBackgroundProxy.recycleTile(tile);
        }

        public void removeTile(int generation, int position) {
            if (isRequestedGeneration(generation)) {
                Tile<T> tile = AsyncListUtil.this.mTileList.removeAtPos(position);
                if (tile != null) {
                    AsyncListUtil.this.mBackgroundProxy.recycleTile(tile);
                    return;
                }
                Log.e(AsyncListUtil.TAG, "tile not found @" + position);
            }
        }

        private void recycleAllTiles() {
            for (int i = 0; i < AsyncListUtil.this.mTileList.size(); i++) {
                AsyncListUtil.this.mBackgroundProxy.recycleTile(AsyncListUtil.this.mTileList.getAtIndex(i));
            }
            AsyncListUtil.this.mTileList.clear();
        }

        private boolean isRequestedGeneration(int generation) {
            return generation == AsyncListUtil.this.mRequestedGeneration;
        }
    };
    final MainThreadCallback<T> mMainThreadProxy;
    private final SparseIntArray mMissingPositions = new SparseIntArray();
    final int[] mPrevRange = new int[2];
    int mRequestedGeneration = this.mDisplayedGeneration;
    private int mScrollHint = 0;
    final Class<T> mTClass;
    final TileList<T> mTileList;
    final int mTileSize;
    final int[] mTmpRange = new int[2];
    final int[] mTmpRangeExtended = new int[2];
    final ViewCallback mViewCallback;

    public static abstract class DataCallback<T> {
        @WorkerThread
        public abstract void fillData(T[] tArr, int i, int i2);

        @WorkerThread
        public abstract int refreshData();

        @WorkerThread
        public void recycleData(T[] tArr, int itemCount) {
        }

        @WorkerThread
        public int getMaxCachedTiles() {
            return 10;
        }
    }

    public static abstract class ViewCallback {
        public static final int HINT_SCROLL_ASC = 2;
        public static final int HINT_SCROLL_DESC = 1;
        public static final int HINT_SCROLL_NONE = 0;

        @UiThread
        public abstract void getItemRangeInto(int[] iArr);

        @UiThread
        public abstract void onDataRefresh();

        @UiThread
        public abstract void onItemLoaded(int i);

        @UiThread
        public void extendRangeInto(int[] range, int[] outRange, int scrollHint) {
            int i;
            int fullRange = (range[1] - range[0]) + 1;
            int halfRange = fullRange / 2;
            int i2 = range[0];
            if (scrollHint != 1) {
                i = halfRange;
            } else {
                i = fullRange;
            }
            outRange[0] = i2 - i;
            i = range[1];
            if (scrollHint == 2) {
                halfRange = fullRange;
            }
            outRange[1] = i + halfRange;
        }
    }

    private void log(String s, Object... args) {
        Log.d(TAG, "[MAIN] " + String.format(s, args));
    }

    public AsyncListUtil(Class<T> klass, int tileSize, DataCallback<T> dataCallback, ViewCallback viewCallback) {
        this.mTClass = klass;
        this.mTileSize = tileSize;
        this.mDataCallback = dataCallback;
        this.mViewCallback = viewCallback;
        this.mTileList = new TileList(this.mTileSize);
        ThreadUtil<T> threadUtil = new MessageThreadUtil();
        this.mMainThreadProxy = threadUtil.getMainThreadProxy(this.mMainThreadCallback);
        this.mBackgroundProxy = threadUtil.getBackgroundProxy(this.mBackgroundCallback);
        refresh();
    }

    private boolean isRefreshPending() {
        return this.mRequestedGeneration != this.mDisplayedGeneration;
    }

    public void onRangeChanged() {
        if (!isRefreshPending()) {
            updateRange();
            this.mAllowScrollHints = true;
        }
    }

    public void refresh() {
        this.mMissingPositions.clear();
        BackgroundCallback backgroundCallback = this.mBackgroundProxy;
        int i = this.mRequestedGeneration + 1;
        this.mRequestedGeneration = i;
        backgroundCallback.refresh(i);
    }

    public T getItem(int position) {
        if (position >= 0 && position < this.mItemCount) {
            T item = this.mTileList.getItemAt(position);
            if (item == null && !isRefreshPending()) {
                this.mMissingPositions.put(position, 0);
            }
            return item;
        }
        throw new IndexOutOfBoundsException(position + " is not within 0 and " + this.mItemCount);
    }

    public int getItemCount() {
        return this.mItemCount;
    }

    /* JADX WARNING: Missing block: B:2:0x0013, code:
            return;
     */
    private void updateRange() {
        /*
        r6 = this;
        r5 = 1;
        r4 = 0;
        r0 = r6.mViewCallback;
        r1 = r6.mTmpRange;
        r0.getItemRangeInto(r1);
        r0 = r6.mTmpRange;
        r0 = r0[r4];
        r1 = r6.mTmpRange;
        r1 = r1[r5];
        if (r0 <= r1) goto L_0x0014;
    L_0x0013:
        return;
    L_0x0014:
        r0 = r6.mTmpRange;
        r0 = r0[r4];
        if (r0 < 0) goto L_0x0013;
    L_0x001a:
        r0 = r6.mTmpRange;
        r0 = r0[r5];
        r1 = r6.mItemCount;
        if (r0 >= r1) goto L_0x0091;
    L_0x0022:
        r0 = r6.mAllowScrollHints;
        if (r0 == 0) goto L_0x0092;
    L_0x0026:
        r0 = r6.mTmpRange;
        r0 = r0[r4];
        r1 = r6.mPrevRange;
        r1 = r1[r5];
        if (r0 <= r1) goto L_0x0095;
    L_0x0030:
        r6.mScrollHint = r4;
    L_0x0032:
        r0 = r6.mPrevRange;
        r1 = r6.mTmpRange;
        r1 = r1[r4];
        r0[r4] = r1;
        r0 = r6.mPrevRange;
        r1 = r6.mTmpRange;
        r1 = r1[r5];
        r0[r5] = r1;
        r0 = r6.mViewCallback;
        r1 = r6.mTmpRange;
        r2 = r6.mTmpRangeExtended;
        r3 = r6.mScrollHint;
        r0.extendRangeInto(r1, r2, r3);
        r0 = r6.mTmpRangeExtended;
        r1 = r6.mTmpRange;
        r1 = r1[r4];
        r2 = r6.mTmpRangeExtended;
        r2 = r2[r4];
        r2 = java.lang.Math.max(r2, r4);
        r1 = java.lang.Math.min(r1, r2);
        r0[r4] = r1;
        r0 = r6.mTmpRangeExtended;
        r1 = r6.mTmpRange;
        r1 = r1[r5];
        r2 = r6.mTmpRangeExtended;
        r2 = r2[r5];
        r3 = r6.mItemCount;
        r3 = r3 + -1;
        r2 = java.lang.Math.min(r2, r3);
        r1 = java.lang.Math.max(r1, r2);
        r0[r5] = r1;
        r0 = r6.mBackgroundProxy;
        r1 = r6.mTmpRange;
        r1 = r1[r4];
        r2 = r6.mTmpRange;
        r2 = r2[r5];
        r3 = r6.mTmpRangeExtended;
        r3 = r3[r4];
        r4 = r6.mTmpRangeExtended;
        r4 = r4[r5];
        r5 = r6.mScrollHint;
        r0.updateRange(r1, r2, r3, r4, r5);
        return;
    L_0x0091:
        return;
    L_0x0092:
        r6.mScrollHint = r4;
        goto L_0x0032;
    L_0x0095:
        r0 = r6.mPrevRange;
        r0 = r0[r4];
        r1 = r6.mTmpRange;
        r1 = r1[r5];
        if (r0 > r1) goto L_0x0030;
    L_0x009f:
        r0 = r6.mTmpRange;
        r0 = r0[r4];
        r1 = r6.mPrevRange;
        r1 = r1[r4];
        if (r0 < r1) goto L_0x00b8;
    L_0x00a9:
        r0 = r6.mTmpRange;
        r0 = r0[r4];
        r1 = r6.mPrevRange;
        r1 = r1[r4];
        if (r0 <= r1) goto L_0x0032;
    L_0x00b3:
        r0 = 2;
        r6.mScrollHint = r0;
        goto L_0x0032;
    L_0x00b8:
        r6.mScrollHint = r5;
        goto L_0x0032;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v7.util.AsyncListUtil.updateRange():void");
    }
}
