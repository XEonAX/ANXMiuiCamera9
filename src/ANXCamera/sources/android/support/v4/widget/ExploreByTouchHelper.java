package android.support.v4.widget;

import android.graphics.Rect;
import android.os.Bundle;
import android.support.v4.view.AccessibilityDelegateCompat;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewParentCompat;
import android.support.v4.view.accessibility.AccessibilityEventCompat;
import android.support.v4.view.accessibility.AccessibilityManagerCompat;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.support.v4.view.accessibility.AccessibilityNodeProviderCompat;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public abstract class ExploreByTouchHelper extends AccessibilityDelegateCompat {
    private static final String DEFAULT_CLASS_NAME = View.class.getName();
    public static final int HOST_ID = -1;
    public static final int INVALID_ID = Integer.MIN_VALUE;
    private int mFocusedVirtualViewId = Integer.MIN_VALUE;
    private int mHoveredVirtualViewId = Integer.MIN_VALUE;
    private final AccessibilityManager mManager;
    private ExploreByTouchNodeProvider mNodeProvider;
    private final int[] mTempGlobalRect = new int[2];
    private final Rect mTempParentRect = new Rect();
    private final Rect mTempScreenRect = new Rect();
    private final Rect mTempVisibleRect = new Rect();
    private final View mView;

    private class ExploreByTouchNodeProvider extends AccessibilityNodeProviderCompat {
        private ExploreByTouchNodeProvider() {
        }

        public AccessibilityNodeInfoCompat createAccessibilityNodeInfo(int virtualViewId) {
            return ExploreByTouchHelper.this.createNode(virtualViewId);
        }

        public boolean performAction(int virtualViewId, int action, Bundle arguments) {
            return ExploreByTouchHelper.this.performAction(virtualViewId, action, arguments);
        }
    }

    protected abstract int getVirtualViewAt(float f, float f2);

    protected abstract void getVisibleVirtualViews(List<Integer> list);

    protected abstract boolean onPerformActionForVirtualView(int i, int i2, Bundle bundle);

    protected abstract void onPopulateEventForVirtualView(int i, AccessibilityEvent accessibilityEvent);

    protected abstract void onPopulateNodeForVirtualView(int i, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat);

    public ExploreByTouchHelper(View forView) {
        if (forView != null) {
            this.mView = forView;
            this.mManager = (AccessibilityManager) forView.getContext().getSystemService("accessibility");
            return;
        }
        throw new IllegalArgumentException("View may not be null");
    }

    public AccessibilityNodeProviderCompat getAccessibilityNodeProvider(View host) {
        if (this.mNodeProvider == null) {
            this.mNodeProvider = new ExploreByTouchNodeProvider();
        }
        return this.mNodeProvider;
    }

    public boolean dispatchHoverEvent(MotionEvent event) {
        boolean z = false;
        if (!this.mManager.isEnabled() || !AccessibilityManagerCompat.isTouchExplorationEnabled(this.mManager)) {
            return false;
        }
        switch (event.getAction()) {
            case 7:
            case 9:
                int virtualViewId = getVirtualViewAt(event.getX(), event.getY());
                updateHoveredVirtualView(virtualViewId);
                if (virtualViewId != Integer.MIN_VALUE) {
                    z = true;
                }
                return z;
            case 10:
                if (this.mFocusedVirtualViewId == Integer.MIN_VALUE) {
                    return false;
                }
                updateHoveredVirtualView(Integer.MIN_VALUE);
                return true;
            default:
                return false;
        }
    }

    public boolean sendEventForVirtualView(int virtualViewId, int eventType) {
        if (virtualViewId == Integer.MIN_VALUE || !this.mManager.isEnabled()) {
            return false;
        }
        ViewParent parent = this.mView.getParent();
        if (parent == null) {
            return false;
        }
        return ViewParentCompat.requestSendAccessibilityEvent(parent, this.mView, createEvent(virtualViewId, eventType));
    }

    public void invalidateRoot() {
        invalidateVirtualView(-1);
    }

    public void invalidateVirtualView(int virtualViewId) {
        sendEventForVirtualView(virtualViewId, 2048);
    }

    public int getFocusedVirtualView() {
        return this.mFocusedVirtualViewId;
    }

    private void updateHoveredVirtualView(int virtualViewId) {
        if (this.mHoveredVirtualViewId != virtualViewId) {
            int previousVirtualViewId = this.mHoveredVirtualViewId;
            this.mHoveredVirtualViewId = virtualViewId;
            sendEventForVirtualView(virtualViewId, 128);
            sendEventForVirtualView(previousVirtualViewId, 256);
        }
    }

    private AccessibilityEvent createEvent(int virtualViewId, int eventType) {
        switch (virtualViewId) {
            case -1:
                return createEventForHost(eventType);
            default:
                return createEventForChild(virtualViewId, eventType);
        }
    }

    private AccessibilityEvent createEventForHost(int eventType) {
        AccessibilityEvent event = AccessibilityEvent.obtain(eventType);
        ViewCompat.onInitializeAccessibilityEvent(this.mView, event);
        return event;
    }

    private AccessibilityEvent createEventForChild(int virtualViewId, int eventType) {
        AccessibilityEvent event = AccessibilityEvent.obtain(eventType);
        event.setEnabled(true);
        event.setClassName(DEFAULT_CLASS_NAME);
        onPopulateEventForVirtualView(virtualViewId, event);
        if (event.getText().isEmpty() && event.getContentDescription() == null) {
            throw new RuntimeException("Callbacks must add text or a content description in populateEventForVirtualViewId()");
        }
        event.setPackageName(this.mView.getContext().getPackageName());
        AccessibilityEventCompat.asRecord(event).setSource(this.mView, virtualViewId);
        return event;
    }

    private AccessibilityNodeInfoCompat createNode(int virtualViewId) {
        switch (virtualViewId) {
            case -1:
                return createNodeForHost();
            default:
                return createNodeForChild(virtualViewId);
        }
    }

    private AccessibilityNodeInfoCompat createNodeForHost() {
        AccessibilityNodeInfoCompat node = AccessibilityNodeInfoCompat.obtain(this.mView);
        ViewCompat.onInitializeAccessibilityNodeInfo(this.mView, node);
        onPopulateNodeForHost(node);
        LinkedList<Integer> virtualViewIds = new LinkedList();
        getVisibleVirtualViews(virtualViewIds);
        Iterator i$ = virtualViewIds.iterator();
        while (i$.hasNext()) {
            node.addChild(this.mView, ((Integer) i$.next()).intValue());
        }
        return node;
    }

    private AccessibilityNodeInfoCompat createNodeForChild(int virtualViewId) {
        AccessibilityNodeInfoCompat node = AccessibilityNodeInfoCompat.obtain();
        node.setEnabled(true);
        node.setClassName(DEFAULT_CLASS_NAME);
        onPopulateNodeForVirtualView(virtualViewId, node);
        if (node.getText() == null && node.getContentDescription() == null) {
            throw new RuntimeException("Callbacks must add text or a content description in populateNodeForVirtualViewId()");
        }
        node.getBoundsInParent(this.mTempParentRect);
        if (this.mTempParentRect.isEmpty()) {
            throw new RuntimeException("Callbacks must set parent bounds in populateNodeForVirtualViewId()");
        }
        int actions = node.getActions();
        if ((actions & 64) != 0) {
            throw new RuntimeException("Callbacks must not add ACTION_ACCESSIBILITY_FOCUS in populateNodeForVirtualViewId()");
        } else if ((actions & 128) == 0) {
            node.setPackageName(this.mView.getContext().getPackageName());
            node.setSource(this.mView, virtualViewId);
            node.setParent(this.mView);
            if (this.mFocusedVirtualViewId != virtualViewId) {
                node.setAccessibilityFocused(false);
                node.addAction(64);
            } else {
                node.setAccessibilityFocused(true);
                node.addAction(128);
            }
            if (intersectVisibleToUser(this.mTempParentRect)) {
                node.setVisibleToUser(true);
                node.setBoundsInParent(this.mTempParentRect);
            }
            this.mView.getLocationOnScreen(this.mTempGlobalRect);
            int offsetX = this.mTempGlobalRect[0];
            int offsetY = this.mTempGlobalRect[1];
            this.mTempScreenRect.set(this.mTempParentRect);
            this.mTempScreenRect.offset(offsetX, offsetY);
            node.setBoundsInScreen(this.mTempScreenRect);
            return node;
        } else {
            throw new RuntimeException("Callbacks must not add ACTION_CLEAR_ACCESSIBILITY_FOCUS in populateNodeForVirtualViewId()");
        }
    }

    private boolean performAction(int virtualViewId, int action, Bundle arguments) {
        switch (virtualViewId) {
            case -1:
                return performActionForHost(action, arguments);
            default:
                return performActionForChild(virtualViewId, action, arguments);
        }
    }

    private boolean performActionForHost(int action, Bundle arguments) {
        return ViewCompat.performAccessibilityAction(this.mView, action, arguments);
    }

    private boolean performActionForChild(int virtualViewId, int action, Bundle arguments) {
        switch (action) {
            case 64:
            case 128:
                return manageFocusForChild(virtualViewId, action, arguments);
            default:
                return onPerformActionForVirtualView(virtualViewId, action, arguments);
        }
    }

    private boolean manageFocusForChild(int virtualViewId, int action, Bundle arguments) {
        switch (action) {
            case 64:
                return requestAccessibilityFocus(virtualViewId);
            case 128:
                return clearAccessibilityFocus(virtualViewId);
            default:
                return false;
        }
    }

    /* JADX WARNING: Missing block: B:2:0x0003, code:
            return false;
     */
    private boolean intersectVisibleToUser(android.graphics.Rect r6) {
        /*
        r5 = this;
        r3 = 0;
        if (r6 != 0) goto L_0x0004;
    L_0x0003:
        return r3;
    L_0x0004:
        r2 = r6.isEmpty();
        if (r2 != 0) goto L_0x0003;
    L_0x000a:
        r2 = r5.mView;
        r2 = r2.getWindowVisibility();
        if (r2 != 0) goto L_0x002f;
    L_0x0012:
        r2 = r5.mView;
        r1 = r2.getParent();
    L_0x0018:
        r2 = r1 instanceof android.view.View;
        if (r2 != 0) goto L_0x0030;
    L_0x001c:
        if (r1 == 0) goto L_0x004d;
    L_0x001e:
        r2 = r5.mView;
        r4 = r5.mTempVisibleRect;
        r2 = r2.getLocalVisibleRect(r4);
        if (r2 == 0) goto L_0x004e;
    L_0x0028:
        r2 = r5.mTempVisibleRect;
        r2 = r6.intersect(r2);
        return r2;
    L_0x002f:
        return r3;
    L_0x0030:
        r0 = r1;
        r0 = (android.view.View) r0;
        r2 = android.support.v4.view.ViewCompat.getAlpha(r0);
        r4 = 0;
        r2 = (r2 > r4 ? 1 : (r2 == r4 ? 0 : -1));
        if (r2 > 0) goto L_0x004a;
    L_0x003c:
        r2 = 1;
    L_0x003d:
        if (r2 != 0) goto L_0x004c;
    L_0x003f:
        r2 = r0.getVisibility();
        if (r2 != 0) goto L_0x004c;
    L_0x0045:
        r1 = r0.getParent();
        goto L_0x0018;
    L_0x004a:
        r2 = r3;
        goto L_0x003d;
    L_0x004c:
        return r3;
    L_0x004d:
        return r3;
    L_0x004e:
        return r3;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.widget.ExploreByTouchHelper.intersectVisibleToUser(android.graphics.Rect):boolean");
    }

    private boolean isAccessibilityFocused(int virtualViewId) {
        return this.mFocusedVirtualViewId == virtualViewId;
    }

    /* JADX WARNING: Missing block: B:2:0x0009, code:
            return false;
     */
    private boolean requestAccessibilityFocus(int r3) {
        /*
        r2 = this;
        r1 = 0;
        r0 = r2.mManager;
        r0 = r0.isEnabled();
        if (r0 != 0) goto L_0x000a;
    L_0x0009:
        return r1;
    L_0x000a:
        r0 = r2.mManager;
        r0 = android.support.v4.view.accessibility.AccessibilityManagerCompat.isTouchExplorationEnabled(r0);
        if (r0 == 0) goto L_0x0009;
    L_0x0012:
        r0 = r2.isAccessibilityFocused(r3);
        if (r0 == 0) goto L_0x0019;
    L_0x0018:
        return r1;
    L_0x0019:
        r0 = r2.mFocusedVirtualViewId;
        r1 = -2147483648; // 0xffffffff80000000 float:-0.0 double:NaN;
        if (r0 != r1) goto L_0x002e;
    L_0x001f:
        r2.mFocusedVirtualViewId = r3;
        r0 = r2.mView;
        r0.invalidate();
        r0 = 32768; // 0x8000 float:4.5918E-41 double:1.61895E-319;
        r2.sendEventForVirtualView(r3, r0);
        r0 = 1;
        return r0;
    L_0x002e:
        r0 = r2.mFocusedVirtualViewId;
        r1 = 65536; // 0x10000 float:9.18355E-41 double:3.2379E-319;
        r2.sendEventForVirtualView(r0, r1);
        goto L_0x001f;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.widget.ExploreByTouchHelper.requestAccessibilityFocus(int):boolean");
    }

    private boolean clearAccessibilityFocus(int virtualViewId) {
        if (!isAccessibilityFocused(virtualViewId)) {
            return false;
        }
        this.mFocusedVirtualViewId = Integer.MIN_VALUE;
        this.mView.invalidate();
        sendEventForVirtualView(virtualViewId, 65536);
        return true;
    }

    public void onPopulateNodeForHost(AccessibilityNodeInfoCompat node) {
    }
}
