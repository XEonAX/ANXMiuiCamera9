package android.support.v4.app;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.Parcelable;
import android.support.annotation.CallSuper;
import android.support.v4.app.BackStackRecord.TransitionState;
import android.support.v4.app.Fragment.SavedState;
import android.support.v4.app.FragmentManager.BackStackEntry;
import android.support.v4.app.FragmentManager.OnBackStackChangedListener;
import android.support.v4.util.DebugUtils;
import android.support.v4.util.LogWriter;
import android.support.v4.view.LayoutInflaterFactory;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationSet;
import android.view.animation.AnimationUtils;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.ScaleAnimation;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* compiled from: FragmentManager */
final class FragmentManagerImpl extends FragmentManager implements LayoutInflaterFactory {
    static final Interpolator ACCELERATE_CUBIC = new AccelerateInterpolator(1.5f);
    static final Interpolator ACCELERATE_QUINT = new AccelerateInterpolator(2.5f);
    static final int ANIM_DUR = 220;
    public static final int ANIM_STYLE_CLOSE_ENTER = 3;
    public static final int ANIM_STYLE_CLOSE_EXIT = 4;
    public static final int ANIM_STYLE_FADE_ENTER = 5;
    public static final int ANIM_STYLE_FADE_EXIT = 6;
    public static final int ANIM_STYLE_OPEN_ENTER = 1;
    public static final int ANIM_STYLE_OPEN_EXIT = 2;
    static boolean DEBUG = false;
    static final Interpolator DECELERATE_CUBIC = new DecelerateInterpolator(1.5f);
    static final Interpolator DECELERATE_QUINT = new DecelerateInterpolator(2.5f);
    static final boolean HONEYCOMB;
    static final String TAG = "FragmentManager";
    static final String TARGET_REQUEST_CODE_STATE_TAG = "android:target_req_state";
    static final String TARGET_STATE_TAG = "android:target_state";
    static final String USER_VISIBLE_HINT_TAG = "android:user_visible_hint";
    static final String VIEW_STATE_TAG = "android:view_state";
    ArrayList<Fragment> mActive;
    ArrayList<Fragment> mAdded;
    ArrayList<Integer> mAvailBackStackIndices;
    ArrayList<Integer> mAvailIndices;
    ArrayList<BackStackRecord> mBackStack;
    ArrayList<OnBackStackChangedListener> mBackStackChangeListeners;
    ArrayList<BackStackRecord> mBackStackIndices;
    FragmentContainer mContainer;
    FragmentController mController;
    ArrayList<Fragment> mCreatedMenus;
    int mCurState = 0;
    boolean mDestroyed;
    Runnable mExecCommit = new Runnable() {
        public void run() {
            FragmentManagerImpl.this.execPendingActions();
        }
    };
    boolean mExecutingActions;
    boolean mHavePendingDeferredStart;
    FragmentHostCallback mHost;
    boolean mNeedMenuInvalidate;
    String mNoTransactionsBecause;
    Fragment mParent;
    ArrayList<Runnable> mPendingActions;
    SparseArray<Parcelable> mStateArray = null;
    Bundle mStateBundle = null;
    boolean mStateSaved;
    Runnable[] mTmpActions;

    /* compiled from: FragmentManager */
    static class AnimateOnHWLayerIfNeededListener implements AnimationListener {
        private boolean mShouldRunOnHWLayer = false;
        private View mView;

        public AnimateOnHWLayerIfNeededListener(View v, Animation anim) {
            if (v != null && anim != null) {
                this.mView = v;
            }
        }

        @CallSuper
        public void onAnimationStart(Animation animation) {
            this.mShouldRunOnHWLayer = FragmentManagerImpl.shouldRunOnHWLayer(this.mView, animation);
            if (this.mShouldRunOnHWLayer) {
                ViewCompat.setLayerType(this.mView, 2, null);
            }
        }

        @CallSuper
        public void onAnimationEnd(Animation animation) {
            if (this.mShouldRunOnHWLayer) {
                ViewCompat.setLayerType(this.mView, 0, null);
            }
        }

        public void onAnimationRepeat(Animation animation) {
        }
    }

    /* compiled from: FragmentManager */
    static class FragmentTag {
        public static final int[] Fragment = new int[]{16842755, 16842960, 16842961};
        public static final int Fragment_id = 1;
        public static final int Fragment_name = 0;
        public static final int Fragment_tag = 2;

        FragmentTag() {
        }
    }

    FragmentManagerImpl() {
    }

    static {
        boolean z = false;
        if (VERSION.SDK_INT >= 11) {
            z = true;
        }
        HONEYCOMB = z;
    }

    static boolean modifiesAlpha(Animation anim) {
        if (anim instanceof AlphaAnimation) {
            return true;
        }
        if (anim instanceof AnimationSet) {
            List<Animation> anims = anim.getAnimations();
            for (int i = 0; i < anims.size(); i++) {
                if (anims.get(i) instanceof AlphaAnimation) {
                    return true;
                }
            }
        }
        return false;
    }

    static boolean shouldRunOnHWLayer(View v, Animation anim) {
        return VERSION.SDK_INT >= 16 && ViewCompat.getLayerType(v) == 0 && ViewCompat.hasOverlappingRendering(v) && modifiesAlpha(anim);
    }

    private void throwException(RuntimeException ex) {
        Log.e(TAG, ex.getMessage());
        Log.e(TAG, "Activity state:");
        PrintWriter pw = new PrintWriter(new LogWriter(TAG));
        if (this.mHost == null) {
            try {
                dump("  ", null, pw, new String[0]);
            } catch (Exception e) {
                Log.e(TAG, "Failed dumping state", e);
            }
        } else {
            try {
                this.mHost.onDump("  ", null, pw, new String[0]);
            } catch (Exception e2) {
                Log.e(TAG, "Failed dumping state", e2);
            }
        }
        throw ex;
    }

    public FragmentTransaction beginTransaction() {
        return new BackStackRecord(this);
    }

    public boolean executePendingTransactions() {
        return execPendingActions();
    }

    public void popBackStack() {
        enqueueAction(new Runnable() {
            public void run() {
                FragmentManagerImpl.this.popBackStackState(FragmentManagerImpl.this.mHost.getHandler(), null, -1, 0);
            }
        }, false);
    }

    public boolean popBackStackImmediate() {
        checkStateLoss();
        executePendingTransactions();
        return popBackStackState(this.mHost.getHandler(), null, -1, 0);
    }

    public void popBackStack(final String name, final int flags) {
        enqueueAction(new Runnable() {
            public void run() {
                FragmentManagerImpl.this.popBackStackState(FragmentManagerImpl.this.mHost.getHandler(), name, -1, flags);
            }
        }, false);
    }

    public boolean popBackStackImmediate(String name, int flags) {
        checkStateLoss();
        executePendingTransactions();
        return popBackStackState(this.mHost.getHandler(), name, -1, flags);
    }

    public void popBackStack(final int id, final int flags) {
        if (id >= 0) {
            enqueueAction(new Runnable() {
                public void run() {
                    FragmentManagerImpl.this.popBackStackState(FragmentManagerImpl.this.mHost.getHandler(), null, id, flags);
                }
            }, false);
            return;
        }
        throw new IllegalArgumentException("Bad id: " + id);
    }

    public boolean popBackStackImmediate(int id, int flags) {
        checkStateLoss();
        executePendingTransactions();
        if (id >= 0) {
            return popBackStackState(this.mHost.getHandler(), null, id, flags);
        }
        throw new IllegalArgumentException("Bad id: " + id);
    }

    public int getBackStackEntryCount() {
        return this.mBackStack == null ? 0 : this.mBackStack.size();
    }

    public BackStackEntry getBackStackEntryAt(int index) {
        return (BackStackEntry) this.mBackStack.get(index);
    }

    public void addOnBackStackChangedListener(OnBackStackChangedListener listener) {
        if (this.mBackStackChangeListeners == null) {
            this.mBackStackChangeListeners = new ArrayList();
        }
        this.mBackStackChangeListeners.add(listener);
    }

    public void removeOnBackStackChangedListener(OnBackStackChangedListener listener) {
        if (this.mBackStackChangeListeners != null) {
            this.mBackStackChangeListeners.remove(listener);
        }
    }

    public void putFragment(Bundle bundle, String key, Fragment fragment) {
        if (fragment.mIndex < 0) {
            throwException(new IllegalStateException("Fragment " + fragment + " is not currently in the FragmentManager"));
        }
        bundle.putInt(key, fragment.mIndex);
    }

    public Fragment getFragment(Bundle bundle, String key) {
        int index = bundle.getInt(key, -1);
        if (index == -1) {
            return null;
        }
        if (index >= this.mActive.size()) {
            throwException(new IllegalStateException("Fragment no longer exists for key " + key + ": index " + index));
        }
        Fragment f = (Fragment) this.mActive.get(index);
        if (f == null) {
            throwException(new IllegalStateException("Fragment no longer exists for key " + key + ": index " + index));
        }
        return f;
    }

    public List<Fragment> getFragments() {
        return this.mActive;
    }

    public SavedState saveFragmentInstanceState(Fragment fragment) {
        SavedState savedState = null;
        if (fragment.mIndex < 0) {
            throwException(new IllegalStateException("Fragment " + fragment + " is not currently in the FragmentManager"));
        }
        if (fragment.mState <= 0) {
            return null;
        }
        Bundle result = saveFragmentBasicState(fragment);
        if (result != null) {
            savedState = new SavedState(result);
        }
        return savedState;
    }

    public boolean isDestroyed() {
        return this.mDestroyed;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(128);
        sb.append("FragmentManager{");
        sb.append(Integer.toHexString(System.identityHashCode(this)));
        sb.append(" in ");
        if (this.mParent == null) {
            DebugUtils.buildShortClassTag(this.mHost, sb);
        } else {
            DebugUtils.buildShortClassTag(this.mParent, sb);
        }
        sb.append("}}");
        return sb.toString();
    }

    public void dump(String prefix, FileDescriptor fd, PrintWriter writer, String[] args) {
        int N;
        int i;
        Fragment f;
        BackStackRecord bs;
        String innerPrefix = prefix + "    ";
        if (this.mActive != null) {
            N = this.mActive.size();
            if (N > 0) {
                writer.print(prefix);
                writer.print("Active Fragments in ");
                writer.print(Integer.toHexString(System.identityHashCode(this)));
                writer.println(":");
                for (i = 0; i < N; i++) {
                    f = (Fragment) this.mActive.get(i);
                    writer.print(prefix);
                    writer.print("  #");
                    writer.print(i);
                    writer.print(": ");
                    writer.println(f);
                    if (f != null) {
                        f.dump(innerPrefix, fd, writer, args);
                    }
                }
            }
        }
        if (this.mAdded != null) {
            N = this.mAdded.size();
            if (N > 0) {
                writer.print(prefix);
                writer.println("Added Fragments:");
                for (i = 0; i < N; i++) {
                    f = (Fragment) this.mAdded.get(i);
                    writer.print(prefix);
                    writer.print("  #");
                    writer.print(i);
                    writer.print(": ");
                    writer.println(f.toString());
                }
            }
        }
        if (this.mCreatedMenus != null) {
            N = this.mCreatedMenus.size();
            if (N > 0) {
                writer.print(prefix);
                writer.println("Fragments Created Menus:");
                for (i = 0; i < N; i++) {
                    f = (Fragment) this.mCreatedMenus.get(i);
                    writer.print(prefix);
                    writer.print("  #");
                    writer.print(i);
                    writer.print(": ");
                    writer.println(f.toString());
                }
            }
        }
        if (this.mBackStack != null) {
            N = this.mBackStack.size();
            if (N > 0) {
                writer.print(prefix);
                writer.println("Back Stack:");
                for (i = 0; i < N; i++) {
                    bs = (BackStackRecord) this.mBackStack.get(i);
                    writer.print(prefix);
                    writer.print("  #");
                    writer.print(i);
                    writer.print(": ");
                    writer.println(bs.toString());
                    bs.dump(innerPrefix, fd, writer, args);
                }
            }
        }
        synchronized (this) {
            if (this.mBackStackIndices != null) {
                N = this.mBackStackIndices.size();
                if (N > 0) {
                    writer.print(prefix);
                    writer.println("Back Stack Indices:");
                    for (i = 0; i < N; i++) {
                        bs = (BackStackRecord) this.mBackStackIndices.get(i);
                        writer.print(prefix);
                        writer.print("  #");
                        writer.print(i);
                        writer.print(": ");
                        writer.println(bs);
                    }
                }
            }
            if (this.mAvailBackStackIndices != null && this.mAvailBackStackIndices.size() > 0) {
                writer.print(prefix);
                writer.print("mAvailBackStackIndices: ");
                writer.println(Arrays.toString(this.mAvailBackStackIndices.toArray()));
            }
        }
        if (this.mPendingActions != null) {
            N = this.mPendingActions.size();
            if (N > 0) {
                writer.print(prefix);
                writer.println("Pending Actions:");
                for (i = 0; i < N; i++) {
                    Runnable r = (Runnable) this.mPendingActions.get(i);
                    writer.print(prefix);
                    writer.print("  #");
                    writer.print(i);
                    writer.print(": ");
                    writer.println(r);
                }
            }
        }
        writer.print(prefix);
        writer.println("FragmentManager misc state:");
        writer.print(prefix);
        writer.print("  mHost=");
        writer.println(this.mHost);
        writer.print(prefix);
        writer.print("  mContainer=");
        writer.println(this.mContainer);
        if (this.mParent != null) {
            writer.print(prefix);
            writer.print("  mParent=");
            writer.println(this.mParent);
        }
        writer.print(prefix);
        writer.print("  mCurState=");
        writer.print(this.mCurState);
        writer.print(" mStateSaved=");
        writer.print(this.mStateSaved);
        writer.print(" mDestroyed=");
        writer.println(this.mDestroyed);
        if (this.mNeedMenuInvalidate) {
            writer.print(prefix);
            writer.print("  mNeedMenuInvalidate=");
            writer.println(this.mNeedMenuInvalidate);
        }
        if (this.mNoTransactionsBecause != null) {
            writer.print(prefix);
            writer.print("  mNoTransactionsBecause=");
            writer.println(this.mNoTransactionsBecause);
        }
        if (this.mAvailIndices != null && this.mAvailIndices.size() > 0) {
            writer.print(prefix);
            writer.print("  mAvailIndices: ");
            writer.println(Arrays.toString(this.mAvailIndices.toArray()));
        }
    }

    static Animation makeOpenCloseAnimation(Context context, float startScale, float endScale, float startAlpha, float endAlpha) {
        AnimationSet set = new AnimationSet(false);
        ScaleAnimation scale = new ScaleAnimation(startScale, endScale, startScale, endScale, 1, 0.5f, 1, 0.5f);
        scale.setInterpolator(DECELERATE_QUINT);
        scale.setDuration(220);
        set.addAnimation(scale);
        AlphaAnimation alpha = new AlphaAnimation(startAlpha, endAlpha);
        alpha.setInterpolator(DECELERATE_CUBIC);
        alpha.setDuration(220);
        set.addAnimation(alpha);
        return set;
    }

    static Animation makeFadeAnimation(Context context, float start, float end) {
        AlphaAnimation anim = new AlphaAnimation(start, end);
        anim.setInterpolator(DECELERATE_CUBIC);
        anim.setDuration(220);
        return anim;
    }

    Animation loadAnimation(Fragment fragment, int transit, boolean enter, int transitionStyle) {
        Animation animObj = fragment.onCreateAnimation(transit, enter, fragment.mNextAnim);
        if (animObj != null) {
            return animObj;
        }
        if (fragment.mNextAnim != 0) {
            Animation anim = AnimationUtils.loadAnimation(this.mHost.getContext(), fragment.mNextAnim);
            if (anim != null) {
                return anim;
            }
        }
        if (transit == 0) {
            return null;
        }
        int styleIndex = transitToStyleIndex(transit, enter);
        if (styleIndex < 0) {
            return null;
        }
        switch (styleIndex) {
            case 1:
                return makeOpenCloseAnimation(this.mHost.getContext(), 1.125f, 1.0f, 0.0f, 1.0f);
            case 2:
                return makeOpenCloseAnimation(this.mHost.getContext(), 1.0f, 0.975f, 1.0f, 0.0f);
            case 3:
                return makeOpenCloseAnimation(this.mHost.getContext(), 0.975f, 1.0f, 0.0f, 1.0f);
            case 4:
                return makeOpenCloseAnimation(this.mHost.getContext(), 1.0f, 1.075f, 1.0f, 0.0f);
            case 5:
                return makeFadeAnimation(this.mHost.getContext(), 0.0f, 1.0f);
            case 6:
                return makeFadeAnimation(this.mHost.getContext(), 1.0f, 0.0f);
            default:
                if (transitionStyle == 0 && this.mHost.onHasWindowAnimations()) {
                    transitionStyle = this.mHost.onGetWindowAnimations();
                }
                return transitionStyle != 0 ? null : null;
        }
    }

    public void performPendingDeferredStart(Fragment f) {
        if (f.mDeferStart) {
            if (this.mExecutingActions) {
                this.mHavePendingDeferredStart = true;
                return;
            }
            f.mDeferStart = false;
            moveToState(f, this.mCurState, 0, 0, false);
        }
    }

    /* JADX WARNING: Missing block: B:1:0x0002, code:
            return;
     */
    private void setHWLayerAnimListenerIfAlpha(android.view.View r2, android.view.animation.Animation r3) {
        /*
        r1 = this;
        if (r2 != 0) goto L_0x0003;
    L_0x0002:
        return;
    L_0x0003:
        if (r3 == 0) goto L_0x0002;
    L_0x0005:
        r0 = shouldRunOnHWLayer(r2, r3);
        if (r0 != 0) goto L_0x000c;
    L_0x000b:
        return;
    L_0x000c:
        r0 = new android.support.v4.app.FragmentManagerImpl$AnimateOnHWLayerIfNeededListener;
        r0.<init>(r2, r3);
        r3.setAnimationListener(r0);
        goto L_0x000b;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.app.FragmentManagerImpl.setHWLayerAnimListenerIfAlpha(android.view.View, android.view.animation.Animation):void");
    }

    /* JADX WARNING: Missing block: B:47:0x007c, code:
            if (r13 > 1) goto L_0x018d;
     */
    /* JADX WARNING: Missing block: B:49:0x007f, code:
            if (r13 > 3) goto L_0x027d;
     */
    /* JADX WARNING: Missing block: B:51:0x0082, code:
            if (r13 <= 4) goto L_0x0017;
     */
    /* JADX WARNING: Missing block: B:53:0x0086, code:
            if (DEBUG != false) goto L_0x02a1;
     */
    /* JADX WARNING: Missing block: B:54:0x0088, code:
            r12.mResumed = true;
            r12.performResume();
            r12.mSavedFragmentState = null;
            r12.mSavedViewState = null;
     */
    /* JADX WARNING: Missing block: B:85:0x018f, code:
            if (DEBUG != false) goto L_0x01a3;
     */
    /* JADX WARNING: Missing block: B:87:0x0193, code:
            if (r12.mFromLayout == false) goto L_0x01be;
     */
    /* JADX WARNING: Missing block: B:88:0x0195, code:
            r12.performActivityCreated(r12.mSavedFragmentState);
     */
    /* JADX WARNING: Missing block: B:89:0x019c, code:
            if (r12.mView != null) goto L_0x0276;
     */
    /* JADX WARNING: Missing block: B:90:0x019e, code:
            r12.mSavedFragmentState = null;
     */
    /* JADX WARNING: Missing block: B:91:0x01a3, code:
            android.util.Log.v(TAG, "moveto ACTIVITY_CREATED: " + r12);
     */
    /* JADX WARNING: Missing block: B:92:0x01be, code:
            r7 = null;
     */
    /* JADX WARNING: Missing block: B:93:0x01c1, code:
            if (r12.mContainerId != 0) goto L_0x01db;
     */
    /* JADX WARNING: Missing block: B:94:0x01c3, code:
            r12.mContainer = r7;
            r12.mView = r12.performCreateView(r12.getLayoutInflater(r12.mSavedFragmentState), r7, r12.mSavedFragmentState);
     */
    /* JADX WARNING: Missing block: B:95:0x01d5, code:
            if (r12.mView != null) goto L_0x022e;
     */
    /* JADX WARNING: Missing block: B:96:0x01d7, code:
            r12.mInnerView = null;
     */
    /* JADX WARNING: Missing block: B:97:0x01db, code:
            r7 = (android.view.ViewGroup) r11.mContainer.onFindViewById(r12.mContainerId);
     */
    /* JADX WARNING: Missing block: B:98:0x01e5, code:
            if (r7 != null) goto L_0x01c3;
     */
    /* JADX WARNING: Missing block: B:100:0x01e9, code:
            if (r12.mRestored != false) goto L_0x01c3;
     */
    /* JADX WARNING: Missing block: B:101:0x01eb, code:
            throwException(new java.lang.IllegalArgumentException("No view found for id 0x" + java.lang.Integer.toHexString(r12.mContainerId) + " (" + r12.getResources().getResourceName(r12.mContainerId) + ") for fragment " + r12));
     */
    /* JADX WARNING: Missing block: B:102:0x022e, code:
            r12.mInnerView = r12.mView;
     */
    /* JADX WARNING: Missing block: B:103:0x0236, code:
            if (android.os.Build.VERSION.SDK_INT >= 11) goto L_0x024f;
     */
    /* JADX WARNING: Missing block: B:104:0x0238, code:
            r12.mView = android.support.v4.app.NoSaveStateFrameLayout.wrap(r12.mView);
     */
    /* JADX WARNING: Missing block: B:105:0x0240, code:
            if (r7 != null) goto L_0x0256;
     */
    /* JADX WARNING: Missing block: B:107:0x0244, code:
            if (r12.mHidden != false) goto L_0x026e;
     */
    /* JADX WARNING: Missing block: B:108:0x0246, code:
            r12.onViewCreated(r12.mView, r12.mSavedFragmentState);
     */
    /* JADX WARNING: Missing block: B:109:0x024f, code:
            android.support.v4.view.ViewCompat.setSaveFromParentEnabled(r12.mView, false);
     */
    /* JADX WARNING: Missing block: B:110:0x0256, code:
            r6 = loadAnimation(r12, r14, true, r15);
     */
    /* JADX WARNING: Missing block: B:111:0x025b, code:
            if (r6 != null) goto L_0x0263;
     */
    /* JADX WARNING: Missing block: B:112:0x025d, code:
            r7.addView(r12.mView);
     */
    /* JADX WARNING: Missing block: B:113:0x0263, code:
            setHWLayerAnimListenerIfAlpha(r12.mView, r6);
            r12.mView.startAnimation(r6);
     */
    /* JADX WARNING: Missing block: B:114:0x026e, code:
            r12.mView.setVisibility(8);
     */
    /* JADX WARNING: Missing block: B:115:0x0276, code:
            r12.restoreViewState(r12.mSavedFragmentState);
     */
    /* JADX WARNING: Missing block: B:117:0x027f, code:
            if (DEBUG != false) goto L_0x0286;
     */
    /* JADX WARNING: Missing block: B:118:0x0281, code:
            r12.performStart();
     */
    /* JADX WARNING: Missing block: B:119:0x0286, code:
            android.util.Log.v(TAG, "moveto STARTED: " + r12);
     */
    /* JADX WARNING: Missing block: B:120:0x02a1, code:
            android.util.Log.v(TAG, "moveto RESUMED: " + r12);
     */
    /* JADX WARNING: Missing block: B:124:0x02c5, code:
            if (r13 >= 1) goto L_0x0017;
     */
    /* JADX WARNING: Missing block: B:126:0x02c9, code:
            if (r11.mDestroyed != false) goto L_0x03e8;
     */
    /* JADX WARNING: Missing block: B:128:0x02cd, code:
            if (r12.mAnimatingAway != null) goto L_0x03f6;
     */
    /* JADX WARNING: Missing block: B:130:0x02d1, code:
            if (DEBUG != false) goto L_0x03fb;
     */
    /* JADX WARNING: Missing block: B:132:0x02d5, code:
            if (r12.mRetaining == false) goto L_0x0417;
     */
    /* JADX WARNING: Missing block: B:133:0x02d7, code:
            r12.mCalled = false;
            r12.onDetach();
     */
    /* JADX WARNING: Missing block: B:134:0x02df, code:
            if (r12.mCalled == false) goto L_0x041c;
     */
    /* JADX WARNING: Missing block: B:135:0x02e1, code:
            if (r16 != false) goto L_0x0017;
     */
    /* JADX WARNING: Missing block: B:137:0x02e5, code:
            if (r12.mRetaining == false) goto L_0x043d;
     */
    /* JADX WARNING: Missing block: B:138:0x02e7, code:
            r12.mHost = null;
            r12.mParentFragment = null;
            r12.mFragmentManager = null;
            r12.mChildFragmentManager = null;
     */
    /* JADX WARNING: Missing block: B:142:0x02f9, code:
            if (r13 < 4) goto L_0x0340;
     */
    /* JADX WARNING: Missing block: B:144:0x02fc, code:
            if (r13 < 3) goto L_0x0363;
     */
    /* JADX WARNING: Missing block: B:146:0x02ff, code:
            if (r13 >= 2) goto L_0x02c4;
     */
    /* JADX WARNING: Missing block: B:148:0x0303, code:
            if (DEBUG != false) goto L_0x0386;
     */
    /* JADX WARNING: Missing block: B:150:0x0307, code:
            if (r12.mView != null) goto L_0x03a2;
     */
    /* JADX WARNING: Missing block: B:151:0x0309, code:
            r12.performDestroyView();
     */
    /* JADX WARNING: Missing block: B:152:0x030e, code:
            if (r12.mView != null) goto L_0x03b3;
     */
    /* JADX WARNING: Missing block: B:153:0x0310, code:
            r12.mContainer = null;
            r12.mView = null;
            r12.mInnerView = null;
     */
    /* JADX WARNING: Missing block: B:159:0x0342, code:
            if (DEBUG != false) goto L_0x0348;
     */
    /* JADX WARNING: Missing block: B:160:0x0344, code:
            r12.performStop();
     */
    /* JADX WARNING: Missing block: B:161:0x0348, code:
            android.util.Log.v(TAG, "movefrom STARTED: " + r12);
     */
    /* JADX WARNING: Missing block: B:163:0x0365, code:
            if (DEBUG != false) goto L_0x036b;
     */
    /* JADX WARNING: Missing block: B:164:0x0367, code:
            r12.performReallyStop();
     */
    /* JADX WARNING: Missing block: B:165:0x036b, code:
            android.util.Log.v(TAG, "movefrom STOPPED: " + r12);
     */
    /* JADX WARNING: Missing block: B:166:0x0386, code:
            android.util.Log.v(TAG, "movefrom ACTIVITY_CREATED: " + r12);
     */
    /* JADX WARNING: Missing block: B:168:0x03a8, code:
            if (r11.mHost.onShouldSaveFragmentState(r12) == false) goto L_0x0309;
     */
    /* JADX WARNING: Missing block: B:170:0x03ac, code:
            if (r12.mSavedViewState != null) goto L_0x0309;
     */
    /* JADX WARNING: Missing block: B:171:0x03ae, code:
            saveFragmentViewState(r12);
     */
    /* JADX WARNING: Missing block: B:173:0x03b5, code:
            if (r12.mContainer == null) goto L_0x0310;
     */
    /* JADX WARNING: Missing block: B:174:0x03b7, code:
            r6 = null;
     */
    /* JADX WARNING: Missing block: B:175:0x03ba, code:
            if (r11.mCurState > 0) goto L_0x03c7;
     */
    /* JADX WARNING: Missing block: B:176:0x03bc, code:
            if (r6 != null) goto L_0x03d1;
     */
    /* JADX WARNING: Missing block: B:177:0x03be, code:
            r12.mContainer.removeView(r12.mView);
     */
    /* JADX WARNING: Missing block: B:179:0x03c9, code:
            if (r11.mDestroyed != false) goto L_0x03bc;
     */
    /* JADX WARNING: Missing block: B:180:0x03cb, code:
            r6 = loadAnimation(r12, r14, false, r15);
     */
    /* JADX WARNING: Missing block: B:181:0x03d1, code:
            r8 = r12;
            r12.mAnimatingAway = r12.mView;
            r12.mStateAfterAnimating = r13;
            r6.setAnimationListener(new android.support.v4.app.FragmentManagerImpl.AnonymousClass5(r11, r12.mView, r6));
            r12.mView.startAnimation(r6);
     */
    /* JADX WARNING: Missing block: B:183:0x03ea, code:
            if (r12.mAnimatingAway == null) goto L_0x02cb;
     */
    /* JADX WARNING: Missing block: B:184:0x03ec, code:
            r9 = r12.mAnimatingAway;
            r12.mAnimatingAway = null;
            r9.clearAnimation();
     */
    /* JADX WARNING: Missing block: B:185:0x03f6, code:
            r12.mStateAfterAnimating = r13;
            r13 = 1;
     */
    /* JADX WARNING: Missing block: B:186:0x03fb, code:
            android.util.Log.v(TAG, "movefrom CREATED: " + r12);
     */
    /* JADX WARNING: Missing block: B:187:0x0417, code:
            r12.performDestroy();
     */
    /* JADX WARNING: Missing block: B:189:0x043c, code:
            throw new android.support.v4.app.SuperNotCalledException("Fragment " + r12 + " did not call through to super.onDetach()");
     */
    /* JADX WARNING: Missing block: B:190:0x043d, code:
            makeInactive(r12);
     */
    void moveToState(final android.support.v4.app.Fragment r12, int r13, int r14, int r15, boolean r16) {
        /*
        r11 = this;
        r0 = r12.mAdded;
        if (r0 != 0) goto L_0x001a;
    L_0x0004:
        r0 = 1;
        if (r13 > r0) goto L_0x001f;
    L_0x0007:
        r0 = r12.mRemoving;
        if (r0 != 0) goto L_0x0021;
    L_0x000b:
        r0 = r12.mDeferStart;
        if (r0 != 0) goto L_0x0028;
    L_0x000f:
        r0 = r12.mState;
        if (r0 < r13) goto L_0x0032;
    L_0x0013:
        r0 = r12.mState;
        if (r0 > r13) goto L_0x02bd;
    L_0x0017:
        r12.mState = r13;
        return;
    L_0x001a:
        r0 = r12.mDetached;
        if (r0 != 0) goto L_0x0004;
    L_0x001e:
        goto L_0x0007;
    L_0x001f:
        r13 = 1;
        goto L_0x0007;
    L_0x0021:
        r0 = r12.mState;
        if (r13 <= r0) goto L_0x000b;
    L_0x0025:
        r13 = r12.mState;
        goto L_0x000b;
    L_0x0028:
        r0 = r12.mState;
        r1 = 4;
        if (r0 >= r1) goto L_0x000f;
    L_0x002d:
        r0 = 3;
        if (r13 <= r0) goto L_0x000f;
    L_0x0030:
        r13 = 3;
        goto L_0x000f;
    L_0x0032:
        r0 = r12.mFromLayout;
        if (r0 != 0) goto L_0x0095;
    L_0x0036:
        r0 = r12.mAnimatingAway;
        if (r0 != 0) goto L_0x009a;
    L_0x003a:
        r0 = r12.mState;
        switch(r0) {
            case 0: goto L_0x0040;
            case 1: goto L_0x007b;
            case 2: goto L_0x007e;
            case 3: goto L_0x007e;
            case 4: goto L_0x0081;
            default: goto L_0x003f;
        };
    L_0x003f:
        goto L_0x0017;
    L_0x0040:
        r0 = DEBUG;
        if (r0 != 0) goto L_0x00a8;
    L_0x0044:
        r0 = r12.mSavedFragmentState;
        if (r0 != 0) goto L_0x00c3;
    L_0x0048:
        r0 = r11.mHost;
        r12.mHost = r0;
        r0 = r11.mParent;
        r12.mParentFragment = r0;
        r0 = r11.mParent;
        if (r0 != 0) goto L_0x0112;
    L_0x0054:
        r0 = r11.mHost;
        r0 = r0.getFragmentManagerImpl();
    L_0x005a:
        r12.mFragmentManager = r0;
        r0 = 0;
        r12.mCalled = r0;
        r0 = r11.mHost;
        r0 = r0.getContext();
        r12.onAttach(r0);
        r0 = r12.mCalled;
        if (r0 == 0) goto L_0x0118;
    L_0x006c:
        r0 = r12.mParentFragment;
        if (r0 == 0) goto L_0x0139;
    L_0x0070:
        r0 = r12.mRetaining;
        if (r0 == 0) goto L_0x0140;
    L_0x0074:
        r0 = 0;
        r12.mRetaining = r0;
        r0 = r12.mFromLayout;
        if (r0 != 0) goto L_0x0147;
    L_0x007b:
        r0 = 1;
        if (r13 > r0) goto L_0x018d;
    L_0x007e:
        r0 = 3;
        if (r13 > r0) goto L_0x027d;
    L_0x0081:
        r0 = 4;
        if (r13 <= r0) goto L_0x0017;
    L_0x0084:
        r0 = DEBUG;
        if (r0 != 0) goto L_0x02a1;
    L_0x0088:
        r0 = 1;
        r12.mResumed = r0;
        r12.performResume();
        r0 = 0;
        r12.mSavedFragmentState = r0;
        r0 = 0;
        r12.mSavedViewState = r0;
        goto L_0x0017;
    L_0x0095:
        r0 = r12.mInLayout;
        if (r0 != 0) goto L_0x0036;
    L_0x0099:
        return;
    L_0x009a:
        r0 = 0;
        r12.mAnimatingAway = r0;
        r2 = r12.mStateAfterAnimating;
        r5 = 1;
        r3 = 0;
        r4 = 0;
        r0 = r11;
        r1 = r12;
        r0.moveToState(r1, r2, r3, r4, r5);
        goto L_0x003a;
    L_0x00a8:
        r0 = new java.lang.StringBuilder;
        r0.<init>();
        r1 = "moveto CREATED: ";
        r0 = r0.append(r1);
        r0 = r0.append(r12);
        r0 = r0.toString();
        r1 = "FragmentManager";
        android.util.Log.v(r1, r0);
        goto L_0x0044;
    L_0x00c3:
        r0 = r12.mSavedFragmentState;
        r1 = r11.mHost;
        r1 = r1.getContext();
        r1 = r1.getClassLoader();
        r0.setClassLoader(r1);
        r0 = r12.mSavedFragmentState;
        r1 = "android:view_state";
        r0 = r0.getSparseParcelableArray(r1);
        r12.mSavedViewState = r0;
        r0 = r12.mSavedFragmentState;
        r1 = "android:target_state";
        r0 = r11.getFragment(r0, r1);
        r12.mTarget = r0;
        r0 = r12.mTarget;
        if (r0 != 0) goto L_0x0105;
    L_0x00ec:
        r0 = r12.mSavedFragmentState;
        r1 = "android:user_visible_hint";
        r2 = 1;
        r0 = r0.getBoolean(r1, r2);
        r12.mUserVisibleHint = r0;
        r0 = r12.mUserVisibleHint;
        if (r0 != 0) goto L_0x0048;
    L_0x00fc:
        r0 = 1;
        r12.mDeferStart = r0;
        r0 = 3;
        if (r13 <= r0) goto L_0x0048;
    L_0x0102:
        r13 = 3;
        goto L_0x0048;
    L_0x0105:
        r0 = r12.mSavedFragmentState;
        r1 = "android:target_req_state";
        r2 = 0;
        r0 = r0.getInt(r1, r2);
        r12.mTargetRequestCode = r0;
        goto L_0x00ec;
    L_0x0112:
        r0 = r11.mParent;
        r0 = r0.mChildFragmentManager;
        goto L_0x005a;
    L_0x0118:
        r0 = new android.support.v4.app.SuperNotCalledException;
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "Fragment ";
        r1 = r1.append(r2);
        r1 = r1.append(r12);
        r2 = " did not call through to super.onAttach()";
        r1 = r1.append(r2);
        r1 = r1.toString();
        r0.<init>(r1);
        throw r0;
    L_0x0139:
        r0 = r11.mHost;
        r0.onAttachFragment(r12);
        goto L_0x0070;
    L_0x0140:
        r0 = r12.mSavedFragmentState;
        r12.performCreate(r0);
        goto L_0x0074;
    L_0x0147:
        r0 = r12.mSavedFragmentState;
        r0 = r12.getLayoutInflater(r0);
        r1 = r12.mSavedFragmentState;
        r2 = 0;
        r0 = r12.performCreateView(r0, r2, r1);
        r12.mView = r0;
        r0 = r12.mView;
        if (r0 != 0) goto L_0x015f;
    L_0x015a:
        r0 = 0;
        r12.mInnerView = r0;
        goto L_0x007b;
    L_0x015f:
        r0 = r12.mView;
        r12.mInnerView = r0;
        r0 = android.os.Build.VERSION.SDK_INT;
        r1 = 11;
        if (r0 >= r1) goto L_0x017e;
    L_0x0169:
        r0 = r12.mView;
        r0 = android.support.v4.app.NoSaveStateFrameLayout.wrap(r0);
        r12.mView = r0;
    L_0x0171:
        r0 = r12.mHidden;
        if (r0 != 0) goto L_0x0185;
    L_0x0175:
        r0 = r12.mView;
        r1 = r12.mSavedFragmentState;
        r12.onViewCreated(r0, r1);
        goto L_0x007b;
    L_0x017e:
        r0 = r12.mView;
        r1 = 0;
        android.support.v4.view.ViewCompat.setSaveFromParentEnabled(r0, r1);
        goto L_0x0171;
    L_0x0185:
        r0 = r12.mView;
        r1 = 8;
        r0.setVisibility(r1);
        goto L_0x0175;
    L_0x018d:
        r0 = DEBUG;
        if (r0 != 0) goto L_0x01a3;
    L_0x0191:
        r0 = r12.mFromLayout;
        if (r0 == 0) goto L_0x01be;
    L_0x0195:
        r0 = r12.mSavedFragmentState;
        r12.performActivityCreated(r0);
        r0 = r12.mView;
        if (r0 != 0) goto L_0x0276;
    L_0x019e:
        r0 = 0;
        r12.mSavedFragmentState = r0;
        goto L_0x007e;
    L_0x01a3:
        r0 = new java.lang.StringBuilder;
        r0.<init>();
        r1 = "moveto ACTIVITY_CREATED: ";
        r0 = r0.append(r1);
        r0 = r0.append(r12);
        r0 = r0.toString();
        r1 = "FragmentManager";
        android.util.Log.v(r1, r0);
        goto L_0x0191;
    L_0x01be:
        r7 = 0;
        r0 = r12.mContainerId;
        if (r0 != 0) goto L_0x01db;
    L_0x01c3:
        r12.mContainer = r7;
        r0 = r12.mSavedFragmentState;
        r0 = r12.getLayoutInflater(r0);
        r1 = r12.mSavedFragmentState;
        r0 = r12.performCreateView(r0, r7, r1);
        r12.mView = r0;
        r0 = r12.mView;
        if (r0 != 0) goto L_0x022e;
    L_0x01d7:
        r0 = 0;
        r12.mInnerView = r0;
        goto L_0x0195;
    L_0x01db:
        r0 = r11.mContainer;
        r1 = r12.mContainerId;
        r7 = r0.onFindViewById(r1);
        r7 = (android.view.ViewGroup) r7;
        if (r7 != 0) goto L_0x01c3;
    L_0x01e7:
        r0 = r12.mRestored;
        if (r0 != 0) goto L_0x01c3;
    L_0x01eb:
        r0 = new java.lang.IllegalArgumentException;
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "No view found for id 0x";
        r1 = r1.append(r2);
        r2 = r12.mContainerId;
        r2 = java.lang.Integer.toHexString(r2);
        r1 = r1.append(r2);
        r2 = " (";
        r1 = r1.append(r2);
        r2 = r12.getResources();
        r3 = r12.mContainerId;
        r2 = r2.getResourceName(r3);
        r1 = r1.append(r2);
        r2 = ") for fragment ";
        r1 = r1.append(r2);
        r1 = r1.append(r12);
        r1 = r1.toString();
        r0.<init>(r1);
        r11.throwException(r0);
        goto L_0x01c3;
    L_0x022e:
        r0 = r12.mView;
        r12.mInnerView = r0;
        r0 = android.os.Build.VERSION.SDK_INT;
        r1 = 11;
        if (r0 >= r1) goto L_0x024f;
    L_0x0238:
        r0 = r12.mView;
        r0 = android.support.v4.app.NoSaveStateFrameLayout.wrap(r0);
        r12.mView = r0;
    L_0x0240:
        if (r7 != 0) goto L_0x0256;
    L_0x0242:
        r0 = r12.mHidden;
        if (r0 != 0) goto L_0x026e;
    L_0x0246:
        r0 = r12.mView;
        r1 = r12.mSavedFragmentState;
        r12.onViewCreated(r0, r1);
        goto L_0x0195;
    L_0x024f:
        r0 = r12.mView;
        r1 = 0;
        android.support.v4.view.ViewCompat.setSaveFromParentEnabled(r0, r1);
        goto L_0x0240;
    L_0x0256:
        r0 = 1;
        r6 = r11.loadAnimation(r12, r14, r0, r15);
        if (r6 != 0) goto L_0x0263;
    L_0x025d:
        r0 = r12.mView;
        r7.addView(r0);
        goto L_0x0242;
    L_0x0263:
        r0 = r12.mView;
        r11.setHWLayerAnimListenerIfAlpha(r0, r6);
        r0 = r12.mView;
        r0.startAnimation(r6);
        goto L_0x025d;
    L_0x026e:
        r0 = r12.mView;
        r1 = 8;
        r0.setVisibility(r1);
        goto L_0x0246;
    L_0x0276:
        r0 = r12.mSavedFragmentState;
        r12.restoreViewState(r0);
        goto L_0x019e;
    L_0x027d:
        r0 = DEBUG;
        if (r0 != 0) goto L_0x0286;
    L_0x0281:
        r12.performStart();
        goto L_0x0081;
    L_0x0286:
        r0 = new java.lang.StringBuilder;
        r0.<init>();
        r1 = "moveto STARTED: ";
        r0 = r0.append(r1);
        r0 = r0.append(r12);
        r0 = r0.toString();
        r1 = "FragmentManager";
        android.util.Log.v(r1, r0);
        goto L_0x0281;
    L_0x02a1:
        r0 = new java.lang.StringBuilder;
        r0.<init>();
        r1 = "moveto RESUMED: ";
        r0 = r0.append(r1);
        r0 = r0.append(r12);
        r0 = r0.toString();
        r1 = "FragmentManager";
        android.util.Log.v(r1, r0);
        goto L_0x0088;
    L_0x02bd:
        r0 = r12.mState;
        switch(r0) {
            case 1: goto L_0x02c4;
            case 2: goto L_0x02fe;
            case 3: goto L_0x02fb;
            case 4: goto L_0x02f8;
            case 5: goto L_0x02f5;
            default: goto L_0x02c2;
        };
    L_0x02c2:
        goto L_0x0017;
    L_0x02c4:
        r0 = 1;
        if (r13 >= r0) goto L_0x0017;
    L_0x02c7:
        r0 = r11.mDestroyed;
        if (r0 != 0) goto L_0x03e8;
    L_0x02cb:
        r0 = r12.mAnimatingAway;
        if (r0 != 0) goto L_0x03f6;
    L_0x02cf:
        r0 = DEBUG;
        if (r0 != 0) goto L_0x03fb;
    L_0x02d3:
        r0 = r12.mRetaining;
        if (r0 == 0) goto L_0x0417;
    L_0x02d7:
        r0 = 0;
        r12.mCalled = r0;
        r12.onDetach();
        r0 = r12.mCalled;
        if (r0 == 0) goto L_0x041c;
    L_0x02e1:
        if (r16 != 0) goto L_0x0017;
    L_0x02e3:
        r0 = r12.mRetaining;
        if (r0 == 0) goto L_0x043d;
    L_0x02e7:
        r0 = 0;
        r12.mHost = r0;
        r0 = 0;
        r12.mParentFragment = r0;
        r0 = 0;
        r12.mFragmentManager = r0;
        r0 = 0;
        r12.mChildFragmentManager = r0;
        goto L_0x0017;
    L_0x02f5:
        r0 = 5;
        if (r13 < r0) goto L_0x031a;
    L_0x02f8:
        r0 = 4;
        if (r13 < r0) goto L_0x0340;
    L_0x02fb:
        r0 = 3;
        if (r13 < r0) goto L_0x0363;
    L_0x02fe:
        r0 = 2;
        if (r13 >= r0) goto L_0x02c4;
    L_0x0301:
        r0 = DEBUG;
        if (r0 != 0) goto L_0x0386;
    L_0x0305:
        r0 = r12.mView;
        if (r0 != 0) goto L_0x03a2;
    L_0x0309:
        r12.performDestroyView();
        r0 = r12.mView;
        if (r0 != 0) goto L_0x03b3;
    L_0x0310:
        r0 = 0;
        r12.mContainer = r0;
        r0 = 0;
        r12.mView = r0;
        r0 = 0;
        r12.mInnerView = r0;
        goto L_0x02c4;
    L_0x031a:
        r0 = DEBUG;
        if (r0 != 0) goto L_0x0325;
    L_0x031e:
        r12.performPause();
        r0 = 0;
        r12.mResumed = r0;
        goto L_0x02f8;
    L_0x0325:
        r0 = new java.lang.StringBuilder;
        r0.<init>();
        r1 = "movefrom RESUMED: ";
        r0 = r0.append(r1);
        r0 = r0.append(r12);
        r0 = r0.toString();
        r1 = "FragmentManager";
        android.util.Log.v(r1, r0);
        goto L_0x031e;
    L_0x0340:
        r0 = DEBUG;
        if (r0 != 0) goto L_0x0348;
    L_0x0344:
        r12.performStop();
        goto L_0x02fb;
    L_0x0348:
        r0 = new java.lang.StringBuilder;
        r0.<init>();
        r1 = "movefrom STARTED: ";
        r0 = r0.append(r1);
        r0 = r0.append(r12);
        r0 = r0.toString();
        r1 = "FragmentManager";
        android.util.Log.v(r1, r0);
        goto L_0x0344;
    L_0x0363:
        r0 = DEBUG;
        if (r0 != 0) goto L_0x036b;
    L_0x0367:
        r12.performReallyStop();
        goto L_0x02fe;
    L_0x036b:
        r0 = new java.lang.StringBuilder;
        r0.<init>();
        r1 = "movefrom STOPPED: ";
        r0 = r0.append(r1);
        r0 = r0.append(r12);
        r0 = r0.toString();
        r1 = "FragmentManager";
        android.util.Log.v(r1, r0);
        goto L_0x0367;
    L_0x0386:
        r0 = new java.lang.StringBuilder;
        r0.<init>();
        r1 = "movefrom ACTIVITY_CREATED: ";
        r0 = r0.append(r1);
        r0 = r0.append(r12);
        r0 = r0.toString();
        r1 = "FragmentManager";
        android.util.Log.v(r1, r0);
        goto L_0x0305;
    L_0x03a2:
        r0 = r11.mHost;
        r0 = r0.onShouldSaveFragmentState(r12);
        if (r0 == 0) goto L_0x0309;
    L_0x03aa:
        r0 = r12.mSavedViewState;
        if (r0 != 0) goto L_0x0309;
    L_0x03ae:
        r11.saveFragmentViewState(r12);
        goto L_0x0309;
    L_0x03b3:
        r0 = r12.mContainer;
        if (r0 == 0) goto L_0x0310;
    L_0x03b7:
        r6 = 0;
        r0 = r11.mCurState;
        if (r0 > 0) goto L_0x03c7;
    L_0x03bc:
        if (r6 != 0) goto L_0x03d1;
    L_0x03be:
        r0 = r12.mContainer;
        r1 = r12.mView;
        r0.removeView(r1);
        goto L_0x0310;
    L_0x03c7:
        r0 = r11.mDestroyed;
        if (r0 != 0) goto L_0x03bc;
    L_0x03cb:
        r0 = 0;
        r6 = r11.loadAnimation(r12, r14, r0, r15);
        goto L_0x03bc;
    L_0x03d1:
        r8 = r12;
        r0 = r12.mView;
        r12.mAnimatingAway = r0;
        r12.mStateAfterAnimating = r13;
        r10 = r12.mView;
        r0 = new android.support.v4.app.FragmentManagerImpl$5;
        r0.<init>(r10, r6, r12);
        r6.setAnimationListener(r0);
        r0 = r12.mView;
        r0.startAnimation(r6);
        goto L_0x03be;
    L_0x03e8:
        r0 = r12.mAnimatingAway;
        if (r0 == 0) goto L_0x02cb;
    L_0x03ec:
        r9 = r12.mAnimatingAway;
        r0 = 0;
        r12.mAnimatingAway = r0;
        r9.clearAnimation();
        goto L_0x02cb;
    L_0x03f6:
        r12.mStateAfterAnimating = r13;
        r13 = 1;
        goto L_0x0017;
    L_0x03fb:
        r0 = new java.lang.StringBuilder;
        r0.<init>();
        r1 = "movefrom CREATED: ";
        r0 = r0.append(r1);
        r0 = r0.append(r12);
        r0 = r0.toString();
        r1 = "FragmentManager";
        android.util.Log.v(r1, r0);
        goto L_0x02d3;
    L_0x0417:
        r12.performDestroy();
        goto L_0x02d7;
    L_0x041c:
        r0 = new android.support.v4.app.SuperNotCalledException;
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "Fragment ";
        r1 = r1.append(r2);
        r1 = r1.append(r12);
        r2 = " did not call through to super.onDetach()";
        r1 = r1.append(r2);
        r1 = r1.toString();
        r0.<init>(r1);
        throw r0;
    L_0x043d:
        r11.makeInactive(r12);
        goto L_0x0017;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.app.FragmentManagerImpl.moveToState(android.support.v4.app.Fragment, int, int, int, boolean):void");
    }

    void moveToState(Fragment f) {
        moveToState(f, this.mCurState, 0, 0, false);
    }

    void moveToState(int newState, boolean always) {
        moveToState(newState, 0, 0, always);
    }

    void moveToState(int newState, int transit, int transitStyle, boolean always) {
        if (this.mHost == null && newState != 0) {
            throw new IllegalStateException("No host");
        } else if (always || this.mCurState != newState) {
            this.mCurState = newState;
            if (this.mActive != null) {
                boolean loadersRunning = false;
                for (int i = 0; i < this.mActive.size(); i++) {
                    Fragment f = (Fragment) this.mActive.get(i);
                    if (f != null) {
                        moveToState(f, newState, transit, transitStyle, false);
                        if (f.mLoaderManager != null) {
                            loadersRunning |= f.mLoaderManager.hasRunningLoaders();
                        }
                    }
                }
                if (!loadersRunning) {
                    startPendingDeferredFragments();
                }
                if (this.mNeedMenuInvalidate && this.mHost != null && this.mCurState == 5) {
                    this.mHost.onSupportInvalidateOptionsMenu();
                    this.mNeedMenuInvalidate = false;
                }
            }
        }
    }

    void startPendingDeferredFragments() {
        if (this.mActive != null) {
            for (int i = 0; i < this.mActive.size(); i++) {
                Fragment f = (Fragment) this.mActive.get(i);
                if (f != null) {
                    performPendingDeferredStart(f);
                }
            }
        }
    }

    void makeActive(Fragment f) {
        if (f.mIndex < 0) {
            if (this.mAvailIndices != null && this.mAvailIndices.size() > 0) {
                f.setIndex(((Integer) this.mAvailIndices.remove(this.mAvailIndices.size() - 1)).intValue(), this.mParent);
                this.mActive.set(f.mIndex, f);
            } else {
                if (this.mActive == null) {
                    this.mActive = new ArrayList();
                }
                f.setIndex(this.mActive.size(), this.mParent);
                this.mActive.add(f);
            }
            if (DEBUG) {
                Log.v(TAG, "Allocated fragment index " + f);
            }
        }
    }

    void makeInactive(Fragment f) {
        if (f.mIndex >= 0) {
            if (DEBUG) {
                Log.v(TAG, "Freeing fragment index " + f);
            }
            this.mActive.set(f.mIndex, null);
            if (this.mAvailIndices == null) {
                this.mAvailIndices = new ArrayList();
            }
            this.mAvailIndices.add(Integer.valueOf(f.mIndex));
            this.mHost.inactivateFragment(f.mWho);
            f.initState();
        }
    }

    public void addFragment(Fragment fragment, boolean moveToStateNow) {
        if (this.mAdded == null) {
            this.mAdded = new ArrayList();
        }
        if (DEBUG) {
            Log.v(TAG, "add: " + fragment);
        }
        makeActive(fragment);
        if (!fragment.mDetached) {
            if (this.mAdded.contains(fragment)) {
                throw new IllegalStateException("Fragment already added: " + fragment);
            }
            this.mAdded.add(fragment);
            fragment.mAdded = true;
            fragment.mRemoving = false;
            if (fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            if (moveToStateNow) {
                moveToState(fragment);
            }
        }
    }

    public void removeFragment(Fragment fragment, int transition, int transitionStyle) {
        boolean inactive;
        if (DEBUG) {
            Log.v(TAG, "remove: " + fragment + " nesting=" + fragment.mBackStackNesting);
        }
        if (fragment.isInBackStack()) {
            inactive = false;
        } else {
            inactive = true;
        }
        if (!fragment.mDetached || inactive) {
            int i;
            if (this.mAdded != null) {
                this.mAdded.remove(fragment);
            }
            if (fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            fragment.mAdded = false;
            fragment.mRemoving = true;
            if (inactive) {
                i = 0;
            } else {
                i = 1;
            }
            moveToState(fragment, i, transition, transitionStyle, false);
        }
    }

    public void hideFragment(Fragment fragment, int transition, int transitionStyle) {
        if (DEBUG) {
            Log.v(TAG, "hide: " + fragment);
        }
        if (!fragment.mHidden) {
            fragment.mHidden = true;
            if (fragment.mView != null) {
                Animation anim = loadAnimation(fragment, transition, false, transitionStyle);
                if (anim != null) {
                    setHWLayerAnimListenerIfAlpha(fragment.mView, anim);
                    fragment.mView.startAnimation(anim);
                }
                fragment.mView.setVisibility(8);
            }
            if (fragment.mAdded && fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            fragment.onHiddenChanged(true);
        }
    }

    public void showFragment(Fragment fragment, int transition, int transitionStyle) {
        if (DEBUG) {
            Log.v(TAG, "show: " + fragment);
        }
        if (fragment.mHidden) {
            fragment.mHidden = false;
            if (fragment.mView != null) {
                Animation anim = loadAnimation(fragment, transition, true, transitionStyle);
                if (anim != null) {
                    setHWLayerAnimListenerIfAlpha(fragment.mView, anim);
                    fragment.mView.startAnimation(anim);
                }
                fragment.mView.setVisibility(0);
            }
            if (fragment.mAdded && fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            fragment.onHiddenChanged(false);
        }
    }

    public void detachFragment(Fragment fragment, int transition, int transitionStyle) {
        if (DEBUG) {
            Log.v(TAG, "detach: " + fragment);
        }
        if (!fragment.mDetached) {
            fragment.mDetached = true;
            if (fragment.mAdded) {
                if (this.mAdded != null) {
                    if (DEBUG) {
                        Log.v(TAG, "remove from detach: " + fragment);
                    }
                    this.mAdded.remove(fragment);
                }
                if (fragment.mHasMenu && fragment.mMenuVisible) {
                    this.mNeedMenuInvalidate = true;
                }
                fragment.mAdded = false;
                moveToState(fragment, 1, transition, transitionStyle, false);
            }
        }
    }

    public void attachFragment(Fragment fragment, int transition, int transitionStyle) {
        if (DEBUG) {
            Log.v(TAG, "attach: " + fragment);
        }
        if (fragment.mDetached) {
            fragment.mDetached = false;
            if (!fragment.mAdded) {
                if (this.mAdded == null) {
                    this.mAdded = new ArrayList();
                }
                if (this.mAdded.contains(fragment)) {
                    throw new IllegalStateException("Fragment already added: " + fragment);
                }
                if (DEBUG) {
                    Log.v(TAG, "add from attach: " + fragment);
                }
                this.mAdded.add(fragment);
                fragment.mAdded = true;
                if (fragment.mHasMenu && fragment.mMenuVisible) {
                    this.mNeedMenuInvalidate = true;
                }
                moveToState(fragment, this.mCurState, transition, transitionStyle, false);
            }
        }
    }

    public Fragment findFragmentById(int id) {
        int i;
        Fragment f;
        if (this.mAdded != null) {
            for (i = this.mAdded.size() - 1; i >= 0; i--) {
                f = (Fragment) this.mAdded.get(i);
                if (f != null && f.mFragmentId == id) {
                    return f;
                }
            }
        }
        if (this.mActive != null) {
            for (i = this.mActive.size() - 1; i >= 0; i--) {
                f = (Fragment) this.mActive.get(i);
                if (f != null && f.mFragmentId == id) {
                    return f;
                }
            }
        }
        return null;
    }

    public Fragment findFragmentByTag(String tag) {
        int i;
        Fragment f;
        if (!(this.mAdded == null || tag == null)) {
            for (i = this.mAdded.size() - 1; i >= 0; i--) {
                f = (Fragment) this.mAdded.get(i);
                if (f != null && tag.equals(f.mTag)) {
                    return f;
                }
            }
        }
        if (!(this.mActive == null || tag == null)) {
            for (i = this.mActive.size() - 1; i >= 0; i--) {
                f = (Fragment) this.mActive.get(i);
                if (f != null && tag.equals(f.mTag)) {
                    return f;
                }
            }
        }
        return null;
    }

    public Fragment findFragmentByWho(String who) {
        if (!(this.mActive == null || who == null)) {
            for (int i = this.mActive.size() - 1; i >= 0; i--) {
                Fragment f = (Fragment) this.mActive.get(i);
                if (f != null) {
                    f = f.findFragmentByWho(who);
                    if (f != null) {
                        return f;
                    }
                }
            }
        }
        return null;
    }

    private void checkStateLoss() {
        if (this.mStateSaved) {
            throw new IllegalStateException("Can not perform this action after onSaveInstanceState");
        } else if (this.mNoTransactionsBecause != null) {
            throw new IllegalStateException("Can not perform this action inside of " + this.mNoTransactionsBecause);
        }
    }

    public void enqueueAction(Runnable action, boolean allowStateLoss) {
        if (!allowStateLoss) {
            checkStateLoss();
        }
        synchronized (this) {
            if (!this.mDestroyed) {
                if (this.mHost != null) {
                    if (this.mPendingActions == null) {
                        this.mPendingActions = new ArrayList();
                    }
                    this.mPendingActions.add(action);
                    if (this.mPendingActions.size() == 1) {
                        this.mHost.getHandler().removeCallbacks(this.mExecCommit);
                        this.mHost.getHandler().post(this.mExecCommit);
                    }
                }
            }
            throw new IllegalStateException("Activity has been destroyed");
        }
    }

    public int allocBackStackIndex(BackStackRecord bse) {
        synchronized (this) {
            int index;
            if (this.mAvailBackStackIndices != null && this.mAvailBackStackIndices.size() > 0) {
                index = ((Integer) this.mAvailBackStackIndices.remove(this.mAvailBackStackIndices.size() - 1)).intValue();
                if (DEBUG) {
                    Log.v(TAG, "Adding back stack index " + index + " with " + bse);
                }
                this.mBackStackIndices.set(index, bse);
                return index;
            }
            if (this.mBackStackIndices == null) {
                this.mBackStackIndices = new ArrayList();
            }
            index = this.mBackStackIndices.size();
            if (DEBUG) {
                Log.v(TAG, "Setting back stack index " + index + " to " + bse);
            }
            this.mBackStackIndices.add(bse);
            return index;
        }
    }

    public void setBackStackIndex(int index, BackStackRecord bse) {
        synchronized (this) {
            if (this.mBackStackIndices == null) {
                this.mBackStackIndices = new ArrayList();
            }
            int N = this.mBackStackIndices.size();
            if (index >= N) {
                while (N < index) {
                    this.mBackStackIndices.add(null);
                    if (this.mAvailBackStackIndices == null) {
                        this.mAvailBackStackIndices = new ArrayList();
                    }
                    if (DEBUG) {
                        Log.v(TAG, "Adding available back stack index " + N);
                    }
                    this.mAvailBackStackIndices.add(Integer.valueOf(N));
                    N++;
                }
                if (DEBUG) {
                    Log.v(TAG, "Adding back stack index " + index + " with " + bse);
                }
                this.mBackStackIndices.add(bse);
            } else {
                if (DEBUG) {
                    Log.v(TAG, "Setting back stack index " + index + " to " + bse);
                }
                this.mBackStackIndices.set(index, bse);
            }
        }
    }

    public void freeBackStackIndex(int index) {
        synchronized (this) {
            this.mBackStackIndices.set(index, null);
            if (this.mAvailBackStackIndices == null) {
                this.mAvailBackStackIndices = new ArrayList();
            }
            if (DEBUG) {
                Log.v(TAG, "Freeing back stack index " + index);
            }
            this.mAvailBackStackIndices.add(Integer.valueOf(index));
        }
    }

    /* JADX WARNING: Missing block: B:26:0x0063, code:
            r11.mExecutingActions = true;
            r4 = 0;
     */
    /* JADX WARNING: Missing block: B:27:0x0067, code:
            if (r4 < r6) goto L_0x0076;
     */
    /* JADX WARNING: Missing block: B:31:0x0070, code:
            if (r11.mTmpActions.length >= r6) goto L_0x004b;
     */
    /* JADX WARNING: Missing block: B:35:0x0076, code:
            r11.mTmpActions[r4].run();
            r11.mTmpActions[r4] = null;
            r4 = r4 + 1;
     */
    public boolean execPendingActions() {
        /*
        r11 = this;
        r10 = 0;
        r9 = 0;
        r7 = r11.mExecutingActions;
        if (r7 != 0) goto L_0x0023;
    L_0x0006:
        r7 = android.os.Looper.myLooper();
        r8 = r11.mHost;
        r8 = r8.getHandler();
        r8 = r8.getLooper();
        if (r7 != r8) goto L_0x002c;
    L_0x0016:
        r2 = 0;
    L_0x0017:
        r0 = r11;
        monitor-enter(r11);
        r7 = r11.mPendingActions;	 Catch:{ all -> 0x0073 }
        if (r7 != 0) goto L_0x0035;
    L_0x001d:
        monitor-exit(r11);	 Catch:{ all -> 0x0073 }
        r7 = r11.mHavePendingDeferredStart;
        if (r7 != 0) goto L_0x0084;
    L_0x0022:
        return r2;
    L_0x0023:
        r7 = new java.lang.IllegalStateException;
        r8 = "Recursive entry to executePendingTransactions";
        r7.<init>(r8);
        throw r7;
    L_0x002c:
        r7 = new java.lang.IllegalStateException;
        r8 = "Must be called from main thread of process";
        r7.<init>(r8);
        throw r7;
    L_0x0035:
        r7 = r11.mPendingActions;	 Catch:{ all -> 0x0073 }
        r7 = r7.size();	 Catch:{ all -> 0x0073 }
        if (r7 == 0) goto L_0x001d;
    L_0x003d:
        r7 = r11.mPendingActions;	 Catch:{ all -> 0x0073 }
        r6 = r7.size();	 Catch:{ all -> 0x0073 }
        r7 = r11.mTmpActions;	 Catch:{ all -> 0x0073 }
        if (r7 != 0) goto L_0x006d;
    L_0x0047:
        r7 = new java.lang.Runnable[r6];	 Catch:{ all -> 0x0073 }
        r11.mTmpActions = r7;	 Catch:{ all -> 0x0073 }
    L_0x004b:
        r7 = r11.mPendingActions;	 Catch:{ all -> 0x0073 }
        r8 = r11.mTmpActions;	 Catch:{ all -> 0x0073 }
        r7.toArray(r8);	 Catch:{ all -> 0x0073 }
        r7 = r11.mPendingActions;	 Catch:{ all -> 0x0073 }
        r7.clear();	 Catch:{ all -> 0x0073 }
        r7 = r11.mHost;	 Catch:{ all -> 0x0073 }
        r7 = r7.getHandler();	 Catch:{ all -> 0x0073 }
        r8 = r11.mExecCommit;	 Catch:{ all -> 0x0073 }
        r7.removeCallbacks(r8);	 Catch:{ all -> 0x0073 }
        monitor-exit(r11);	 Catch:{ all -> 0x0073 }
        r7 = 1;
        r11.mExecutingActions = r7;
        r4 = 0;
    L_0x0067:
        if (r4 < r6) goto L_0x0076;
    L_0x0069:
        r11.mExecutingActions = r9;
        r2 = 1;
        goto L_0x0017;
    L_0x006d:
        r7 = r11.mTmpActions;	 Catch:{ all -> 0x0073 }
        r7 = r7.length;	 Catch:{ all -> 0x0073 }
        if (r7 < r6) goto L_0x0047;
    L_0x0072:
        goto L_0x004b;
    L_0x0073:
        r1 = move-exception;
        monitor-exit(r11);	 Catch:{ all -> 0x0073 }
        throw r1;
    L_0x0076:
        r7 = r11.mTmpActions;
        r7 = r7[r4];
        r7.run();
        r7 = r11.mTmpActions;
        r7[r4] = r10;
        r4 = r4 + 1;
        goto L_0x0067;
    L_0x0084:
        r5 = 0;
        r4 = 0;
    L_0x0086:
        r7 = r11.mActive;
        r7 = r7.size();
        if (r4 < r7) goto L_0x0096;
    L_0x008e:
        if (r5 != 0) goto L_0x0022;
    L_0x0090:
        r11.mHavePendingDeferredStart = r9;
        r11.startPendingDeferredFragments();
        goto L_0x0022;
    L_0x0096:
        r7 = r11.mActive;
        r3 = r7.get(r4);
        r3 = (android.support.v4.app.Fragment) r3;
        if (r3 != 0) goto L_0x00a3;
    L_0x00a0:
        r4 = r4 + 1;
        goto L_0x0086;
    L_0x00a3:
        r7 = r3.mLoaderManager;
        if (r7 == 0) goto L_0x00a0;
    L_0x00a7:
        r7 = r3.mLoaderManager;
        r7 = r7.hasRunningLoaders();
        r5 = r5 | r7;
        goto L_0x00a0;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.app.FragmentManagerImpl.execPendingActions():boolean");
    }

    void reportBackStackChanged() {
        if (this.mBackStackChangeListeners != null) {
            for (int i = 0; i < this.mBackStackChangeListeners.size(); i++) {
                ((OnBackStackChangedListener) this.mBackStackChangeListeners.get(i)).onBackStackChanged();
            }
        }
    }

    void addBackStackState(BackStackRecord state) {
        if (this.mBackStack == null) {
            this.mBackStack = new ArrayList();
        }
        this.mBackStack.add(state);
        reportBackStackChanged();
    }

    boolean popBackStackState(Handler handler, String name, int id, int flags) {
        if (this.mBackStack == null) {
            return false;
        }
        BackStackRecord bss;
        SparseArray<Fragment> firstOutFragments;
        SparseArray<Fragment> lastInFragments;
        if (name == null && id < 0 && (flags & 1) == 0) {
            int last = this.mBackStack.size() - 1;
            if (last < 0) {
                return false;
            }
            bss = (BackStackRecord) this.mBackStack.remove(last);
            firstOutFragments = new SparseArray();
            lastInFragments = new SparseArray();
            bss.calculateBackFragments(firstOutFragments, lastInFragments);
            bss.popFromBackStack(true, null, firstOutFragments, lastInFragments);
            reportBackStackChanged();
        } else {
            int index = -1;
            if (name != null || id >= 0) {
                index = this.mBackStack.size() - 1;
                while (index >= 0) {
                    bss = (BackStackRecord) this.mBackStack.get(index);
                    if ((name != null && name.equals(bss.getName())) || (id >= 0 && id == bss.mIndex)) {
                        break;
                    }
                    index--;
                }
                if (index < 0) {
                    return false;
                }
                if ((flags & 1) != 0) {
                    index--;
                    while (index >= 0) {
                        bss = (BackStackRecord) this.mBackStack.get(index);
                        if ((name == null || !name.equals(bss.getName())) && (id < 0 || id != bss.mIndex)) {
                            break;
                        }
                        index--;
                    }
                }
            }
            if (index == this.mBackStack.size() - 1) {
                return false;
            }
            int i;
            ArrayList<BackStackRecord> states = new ArrayList();
            for (i = this.mBackStack.size() - 1; i > index; i--) {
                states.add(this.mBackStack.remove(i));
            }
            int LAST = states.size() - 1;
            firstOutFragments = new SparseArray();
            lastInFragments = new SparseArray();
            for (i = 0; i <= LAST; i++) {
                ((BackStackRecord) states.get(i)).calculateBackFragments(firstOutFragments, lastInFragments);
            }
            TransitionState state = null;
            i = 0;
            while (i <= LAST) {
                if (DEBUG) {
                    Log.v(TAG, "Popping back stack state: " + states.get(i));
                }
                state = ((BackStackRecord) states.get(i)).popFromBackStack(i == LAST, state, firstOutFragments, lastInFragments);
                i++;
            }
            reportBackStackChanged();
        }
        return true;
    }

    ArrayList<Fragment> retainNonConfig() {
        ArrayList<Fragment> fragments = null;
        if (this.mActive != null) {
            for (int i = 0; i < this.mActive.size(); i++) {
                Fragment f = (Fragment) this.mActive.get(i);
                if (f != null && f.mRetainInstance) {
                    if (fragments == null) {
                        fragments = new ArrayList();
                    }
                    fragments.add(f);
                    f.mRetaining = true;
                    f.mTargetIndex = f.mTarget == null ? -1 : f.mTarget.mIndex;
                    if (DEBUG) {
                        Log.v(TAG, "retainNonConfig: keeping retained " + f);
                    }
                }
            }
        }
        return fragments;
    }

    void saveFragmentViewState(Fragment f) {
        if (f.mInnerView != null) {
            if (this.mStateArray != null) {
                this.mStateArray.clear();
            } else {
                this.mStateArray = new SparseArray();
            }
            f.mInnerView.saveHierarchyState(this.mStateArray);
            if (this.mStateArray.size() > 0) {
                f.mSavedViewState = this.mStateArray;
                this.mStateArray = null;
            }
        }
    }

    Bundle saveFragmentBasicState(Fragment f) {
        Bundle result = null;
        if (this.mStateBundle == null) {
            this.mStateBundle = new Bundle();
        }
        f.performSaveInstanceState(this.mStateBundle);
        if (!this.mStateBundle.isEmpty()) {
            result = this.mStateBundle;
            this.mStateBundle = null;
        }
        if (f.mView != null) {
            saveFragmentViewState(f);
        }
        if (f.mSavedViewState != null) {
            if (result == null) {
                result = new Bundle();
            }
            result.putSparseParcelableArray(VIEW_STATE_TAG, f.mSavedViewState);
        }
        if (!f.mUserVisibleHint) {
            if (result == null) {
                result = new Bundle();
            }
            result.putBoolean(USER_VISIBLE_HINT_TAG, f.mUserVisibleHint);
        }
        return result;
    }

    Parcelable saveAllState() {
        execPendingActions();
        if (HONEYCOMB) {
            this.mStateSaved = true;
        }
        if (this.mActive == null || this.mActive.size() <= 0) {
            return null;
        }
        int i;
        int N = this.mActive.size();
        FragmentState[] active = new FragmentState[N];
        boolean haveFragments = false;
        for (i = 0; i < N; i++) {
            Fragment f = (Fragment) this.mActive.get(i);
            if (f != null) {
                if (f.mIndex < 0) {
                    throwException(new IllegalStateException("Failure saving state: active " + f + " has cleared index: " + f.mIndex));
                }
                haveFragments = true;
                FragmentState fs = new FragmentState(f);
                active[i] = fs;
                if (f.mState > 0 && fs.mSavedFragmentState == null) {
                    fs.mSavedFragmentState = saveFragmentBasicState(f);
                    if (f.mTarget != null) {
                        if (f.mTarget.mIndex < 0) {
                            throwException(new IllegalStateException("Failure saving state: " + f + " has target not in fragment manager: " + f.mTarget));
                        }
                        if (fs.mSavedFragmentState == null) {
                            fs.mSavedFragmentState = new Bundle();
                        }
                        putFragment(fs.mSavedFragmentState, TARGET_STATE_TAG, f.mTarget);
                        if (f.mTargetRequestCode != 0) {
                            fs.mSavedFragmentState.putInt(TARGET_REQUEST_CODE_STATE_TAG, f.mTargetRequestCode);
                        }
                    }
                } else {
                    fs.mSavedFragmentState = f.mSavedFragmentState;
                }
                if (DEBUG) {
                    Log.v(TAG, "Saved state of " + f + ": " + fs.mSavedFragmentState);
                }
            }
        }
        if (haveFragments) {
            int[] added = null;
            BackStackState[] backStack = null;
            if (this.mAdded != null) {
                N = this.mAdded.size();
                if (N > 0) {
                    added = new int[N];
                    for (i = 0; i < N; i++) {
                        added[i] = ((Fragment) this.mAdded.get(i)).mIndex;
                        if (added[i] < 0) {
                            throwException(new IllegalStateException("Failure saving state: active " + this.mAdded.get(i) + " has cleared index: " + added[i]));
                        }
                        if (DEBUG) {
                            Log.v(TAG, "saveAllState: adding fragment #" + i + ": " + this.mAdded.get(i));
                        }
                    }
                }
            }
            if (this.mBackStack != null) {
                N = this.mBackStack.size();
                if (N > 0) {
                    backStack = new BackStackState[N];
                    for (i = 0; i < N; i++) {
                        backStack[i] = new BackStackState((BackStackRecord) this.mBackStack.get(i));
                        if (DEBUG) {
                            Log.v(TAG, "saveAllState: adding back stack #" + i + ": " + this.mBackStack.get(i));
                        }
                    }
                }
            }
            FragmentManagerState fms = new FragmentManagerState();
            fms.mActive = active;
            fms.mAdded = added;
            fms.mBackStack = backStack;
            return fms;
        }
        if (DEBUG) {
            Log.v(TAG, "saveAllState: no fragments!");
        }
        return null;
    }

    void restoreAllState(Parcelable state, List<Fragment> nonConfig) {
        if (state != null) {
            FragmentManagerState fms = (FragmentManagerState) state;
            if (fms.mActive != null) {
                int i;
                Fragment f;
                FragmentState fs;
                if (nonConfig != null) {
                    for (i = 0; i < nonConfig.size(); i++) {
                        f = (Fragment) nonConfig.get(i);
                        if (DEBUG) {
                            Log.v(TAG, "restoreAllState: re-attaching retained " + f);
                        }
                        fs = fms.mActive[f.mIndex];
                        fs.mInstance = f;
                        f.mSavedViewState = null;
                        f.mBackStackNesting = 0;
                        f.mInLayout = false;
                        f.mAdded = false;
                        f.mTarget = null;
                        if (fs.mSavedFragmentState != null) {
                            fs.mSavedFragmentState.setClassLoader(this.mHost.getContext().getClassLoader());
                            f.mSavedViewState = fs.mSavedFragmentState.getSparseParcelableArray(VIEW_STATE_TAG);
                            f.mSavedFragmentState = fs.mSavedFragmentState;
                        }
                    }
                }
                this.mActive = new ArrayList(fms.mActive.length);
                if (this.mAvailIndices != null) {
                    this.mAvailIndices.clear();
                }
                for (i = 0; i < fms.mActive.length; i++) {
                    fs = fms.mActive[i];
                    if (fs == null) {
                        this.mActive.add(null);
                        if (this.mAvailIndices == null) {
                            this.mAvailIndices = new ArrayList();
                        }
                        if (DEBUG) {
                            Log.v(TAG, "restoreAllState: avail #" + i);
                        }
                        this.mAvailIndices.add(Integer.valueOf(i));
                    } else {
                        f = fs.instantiate(this.mHost, this.mParent);
                        if (DEBUG) {
                            Log.v(TAG, "restoreAllState: active #" + i + ": " + f);
                        }
                        this.mActive.add(f);
                        fs.mInstance = null;
                    }
                }
                if (nonConfig != null) {
                    for (i = 0; i < nonConfig.size(); i++) {
                        f = (Fragment) nonConfig.get(i);
                        if (f.mTargetIndex >= 0) {
                            if (f.mTargetIndex >= this.mActive.size()) {
                                Log.w(TAG, "Re-attaching retained fragment " + f + " target no longer exists: " + f.mTargetIndex);
                                f.mTarget = null;
                            } else {
                                f.mTarget = (Fragment) this.mActive.get(f.mTargetIndex);
                            }
                        }
                    }
                }
                if (fms.mAdded == null) {
                    this.mAdded = null;
                } else {
                    this.mAdded = new ArrayList(fms.mAdded.length);
                    for (i = 0; i < fms.mAdded.length; i++) {
                        f = (Fragment) this.mActive.get(fms.mAdded[i]);
                        if (f == null) {
                            throwException(new IllegalStateException("No instantiated fragment for index #" + fms.mAdded[i]));
                        }
                        f.mAdded = true;
                        if (DEBUG) {
                            Log.v(TAG, "restoreAllState: added #" + i + ": " + f);
                        }
                        if (this.mAdded.contains(f)) {
                            throw new IllegalStateException("Already added!");
                        }
                        this.mAdded.add(f);
                    }
                }
                if (fms.mBackStack == null) {
                    this.mBackStack = null;
                } else {
                    this.mBackStack = new ArrayList(fms.mBackStack.length);
                    for (i = 0; i < fms.mBackStack.length; i++) {
                        BackStackRecord bse = fms.mBackStack[i].instantiate(this);
                        if (DEBUG) {
                            Log.v(TAG, "restoreAllState: back stack #" + i + " (index " + bse.mIndex + "): " + bse);
                            bse.dump("  ", new PrintWriter(new LogWriter(TAG)), false);
                        }
                        this.mBackStack.add(bse);
                        if (bse.mIndex >= 0) {
                            setBackStackIndex(bse.mIndex, bse);
                        }
                    }
                }
            }
        }
    }

    public void attachController(FragmentHostCallback host, FragmentContainer container, Fragment parent) {
        if (this.mHost == null) {
            this.mHost = host;
            this.mContainer = container;
            this.mParent = parent;
            return;
        }
        throw new IllegalStateException("Already attached");
    }

    public void noteStateNotSaved() {
        this.mStateSaved = false;
    }

    public void dispatchCreate() {
        this.mStateSaved = false;
        moveToState(1, false);
    }

    public void dispatchActivityCreated() {
        this.mStateSaved = false;
        moveToState(2, false);
    }

    public void dispatchStart() {
        this.mStateSaved = false;
        moveToState(4, false);
    }

    public void dispatchResume() {
        this.mStateSaved = false;
        moveToState(5, false);
    }

    public void dispatchPause() {
        moveToState(4, false);
    }

    public void dispatchStop() {
        this.mStateSaved = true;
        moveToState(3, false);
    }

    public void dispatchReallyStop() {
        moveToState(2, false);
    }

    public void dispatchDestroyView() {
        moveToState(1, false);
    }

    public void dispatchDestroy() {
        this.mDestroyed = true;
        execPendingActions();
        moveToState(0, false);
        this.mHost = null;
        this.mContainer = null;
        this.mParent = null;
    }

    public void dispatchConfigurationChanged(Configuration newConfig) {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = (Fragment) this.mAdded.get(i);
                if (f != null) {
                    f.performConfigurationChanged(newConfig);
                }
            }
        }
    }

    public void dispatchLowMemory() {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = (Fragment) this.mAdded.get(i);
                if (f != null) {
                    f.performLowMemory();
                }
            }
        }
    }

    public boolean dispatchCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        int i;
        Fragment f;
        boolean show = false;
        ArrayList arrayList = null;
        if (this.mAdded != null) {
            for (i = 0; i < this.mAdded.size(); i++) {
                f = (Fragment) this.mAdded.get(i);
                if (f != null && f.performCreateOptionsMenu(menu, inflater)) {
                    show = true;
                    if (arrayList == null) {
                        arrayList = new ArrayList();
                    }
                    arrayList.add(f);
                }
            }
        }
        if (this.mCreatedMenus != null) {
            for (i = 0; i < this.mCreatedMenus.size(); i++) {
                f = (Fragment) this.mCreatedMenus.get(i);
                if (arrayList == null || !arrayList.contains(f)) {
                    f.onDestroyOptionsMenu();
                }
            }
        }
        this.mCreatedMenus = arrayList;
        return show;
    }

    public boolean dispatchPrepareOptionsMenu(Menu menu) {
        boolean show = false;
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = (Fragment) this.mAdded.get(i);
                if (f != null && f.performPrepareOptionsMenu(menu)) {
                    show = true;
                }
            }
        }
        return show;
    }

    public boolean dispatchOptionsItemSelected(MenuItem item) {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = (Fragment) this.mAdded.get(i);
                if (f != null && f.performOptionsItemSelected(item)) {
                    return true;
                }
            }
        }
        return false;
    }

    public boolean dispatchContextItemSelected(MenuItem item) {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = (Fragment) this.mAdded.get(i);
                if (f != null && f.performContextItemSelected(item)) {
                    return true;
                }
            }
        }
        return false;
    }

    public void dispatchOptionsMenuClosed(Menu menu) {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = (Fragment) this.mAdded.get(i);
                if (f != null) {
                    f.performOptionsMenuClosed(menu);
                }
            }
        }
    }

    public static int reverseTransit(int transit) {
        switch (transit) {
            case FragmentTransaction.TRANSIT_FRAGMENT_OPEN /*4097*/:
                return 8194;
            case FragmentTransaction.TRANSIT_FRAGMENT_FADE /*4099*/:
                return FragmentTransaction.TRANSIT_FRAGMENT_FADE;
            case 8194:
                return FragmentTransaction.TRANSIT_FRAGMENT_OPEN;
            default:
                return 0;
        }
    }

    public static int transitToStyleIndex(int transit, boolean enter) {
        switch (transit) {
            case FragmentTransaction.TRANSIT_FRAGMENT_OPEN /*4097*/:
                return !enter ? 2 : 1;
            case FragmentTransaction.TRANSIT_FRAGMENT_FADE /*4099*/:
                return !enter ? 6 : 5;
            case 8194:
                return !enter ? 4 : 3;
            default:
                return -1;
        }
    }

    public View onCreateView(View parent, String name, Context context, AttributeSet attrs) {
        Fragment fragment = null;
        if (!"fragment".equals(name)) {
            return null;
        }
        String fname = attrs.getAttributeValue(null, "class");
        TypedArray a = context.obtainStyledAttributes(attrs, FragmentTag.Fragment);
        if (fname == null) {
            fname = a.getString(0);
        }
        int id = a.getResourceId(1, -1);
        String tag = a.getString(2);
        a.recycle();
        if (!Fragment.isSupportFragmentClass(this.mHost.getContext(), fname)) {
            return null;
        }
        int containerId = parent == null ? 0 : parent.getId();
        if (containerId == -1 && id == -1 && tag == null) {
            throw new IllegalArgumentException(attrs.getPositionDescription() + ": Must specify unique android:id, android:tag, or have a parent with an id for " + fname);
        }
        if (id != -1) {
            fragment = findFragmentById(id);
        }
        if (fragment == null && tag != null) {
            fragment = findFragmentByTag(tag);
        }
        if (fragment == null && containerId != -1) {
            fragment = findFragmentById(containerId);
        }
        if (DEBUG) {
            Log.v(TAG, "onCreateView: id=0x" + Integer.toHexString(id) + " fname=" + fname + " existing=" + fragment);
        }
        if (fragment == null) {
            fragment = Fragment.instantiate(context, fname);
            fragment.mFromLayout = true;
            fragment.mFragmentId = id == 0 ? containerId : id;
            fragment.mContainerId = containerId;
            fragment.mTag = tag;
            fragment.mInLayout = true;
            fragment.mFragmentManager = this;
            fragment.onInflate(this.mHost.getContext(), attrs, fragment.mSavedFragmentState);
            addFragment(fragment, true);
        } else if (fragment.mInLayout) {
            throw new IllegalArgumentException(attrs.getPositionDescription() + ": Duplicate id 0x" + Integer.toHexString(id) + ", tag " + tag + ", or parent id 0x" + Integer.toHexString(containerId) + " with another fragment for " + fname);
        } else {
            fragment.mInLayout = true;
            if (!fragment.mRetaining) {
                fragment.onInflate(this.mHost.getContext(), attrs, fragment.mSavedFragmentState);
            }
        }
        if (this.mCurState < 1 && fragment.mFromLayout) {
            moveToState(fragment, 1, 0, 0, false);
        } else {
            moveToState(fragment);
        }
        if (fragment.mView != null) {
            if (id != 0) {
                fragment.mView.setId(id);
            }
            if (fragment.mView.getTag() == null) {
                fragment.mView.setTag(tag);
            }
            return fragment.mView;
        }
        throw new IllegalStateException("Fragment " + fname + " did not create a view.");
    }

    LayoutInflaterFactory getLayoutInflaterFactory() {
        return this;
    }
}
