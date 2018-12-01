package miui.external;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.DialogFragment;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class SdkErrorActivity extends Activity {
    private static final /* synthetic */ int[] h = null;
    private OnClickListener e = new OnClickListener() {
        public void onClick(DialogInterface dialogInterface, int i) {
            dialogInterface.dismiss();
            SdkErrorActivity.this.finish();
            System.exit(0);
        }
    };
    private String f;
    private OnClickListener g = new OnClickListener() {
        public void onClick(DialogInterface dialogInterface, int i) {
            dialogInterface.dismiss();
            final Dialog u = SdkErrorActivity.this.p();
            new SdkDialogFragment(u).show(SdkErrorActivity.this.getFragmentManager(), "SdkUpdatePromptDialog");
            new AsyncTask<Void, Void, Boolean>() {
                /* renamed from: W */
                protected Boolean doInBackground(Void... voidArr) {
                    try {
                        Thread.sleep(5000);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    return Boolean.valueOf(SdkErrorActivity.this.t());
                }

                /* renamed from: X */
                protected void onPostExecute(Boolean bool) {
                    u.dismiss();
                    new SdkDialogFragment(bool.booleanValue() ? SdkErrorActivity.this.r() : SdkErrorActivity.this.q()).show(SdkErrorActivity.this.getFragmentManager(), "SdkUpdateFinishDialog");
                }
            }.execute(new Void[0]);
        }
    };

    class SdkDialogFragment extends DialogFragment {
        private Dialog i;

        public SdkDialogFragment(Dialog dialog) {
            this.i = dialog;
        }

        public Dialog onCreateDialog(Bundle bundle) {
            return this.i;
        }
    }

    private static /* synthetic */ int[] y() {
        if (h != null) {
            return h;
        }
        int[] iArr = new int[SdkConstants$SdkError.values().length];
        try {
            iArr[SdkConstants$SdkError.GENERIC.ordinal()] = 3;
        } catch (NoSuchFieldError e) {
        }
        try {
            iArr[SdkConstants$SdkError.LOW_SDK_VERSION.ordinal()] = 1;
        } catch (NoSuchFieldError e2) {
        }
        try {
            iArr[SdkConstants$SdkError.NO_SDK.ordinal()] = 2;
        } catch (NoSuchFieldError e3) {
        }
        h = iArr;
        return iArr;
    }

    protected void onCreate(Bundle bundle) {
        Dialog m;
        SdkConstants$SdkError sdkConstants$SdkError = null;
        setTheme(16973909);
        super.onCreate(bundle);
        this.f = Locale.getDefault().getLanguage();
        Intent intent = getIntent();
        if (intent != null) {
            sdkConstants$SdkError = (SdkConstants$SdkError) intent.getSerializableExtra("com.miui.sdk.error");
        }
        if (sdkConstants$SdkError == null) {
            sdkConstants$SdkError = SdkConstants$SdkError.GENERIC;
        }
        switch (y()[sdkConstants$SdkError.ordinal()]) {
            case 1:
                m = m();
                break;
            case 2:
                m = n();
                break;
            default:
                m = l();
                break;
        }
        new SdkDialogFragment(m).show(getFragmentManager(), "SdkErrorPromptDialog");
    }

    private Dialog o(String str, String str2, OnClickListener onClickListener) {
        return new Builder(this).setTitle(str).setMessage(str2).setPositiveButton(17039370, onClickListener).setIcon(17301543).setCancelable(false).create();
    }

    private Dialog k(String str, String str2, OnClickListener onClickListener, OnClickListener onClickListener2) {
        return new Builder(this).setTitle(str).setMessage(str2).setPositiveButton(17039370, onClickListener).setNegativeButton(17039360, onClickListener2).setIcon(17301543).setCancelable(false).create();
    }

    private Dialog l() {
        String str;
        String str2;
        if (Locale.CHINESE.getLanguage().equals(this.f)) {
            str = "MIUI SDK发生错误";
            str2 = "请重新安装MIUI SDK再运行本程序。";
        } else {
            str = "MIUI SDK encounter errors";
            str2 = "Please re-install MIUI SDK and then re-run this application.";
        }
        return o(str, str2, this.e);
    }

    private Dialog n() {
        String str;
        String str2;
        if (Locale.CHINESE.getLanguage().equals(this.f)) {
            str = "没有找到MIUI SDK";
            str2 = "请先安装MIUI SDK再运行本程序。";
        } else {
            str = "MIUI SDK not found";
            str2 = "Please install MIUI SDK and then re-run this application.";
        }
        return o(str, str2, this.e);
    }

    private Dialog m() {
        String str;
        String str2;
        if (s()) {
            if (Locale.CHINESE.getLanguage().equals(this.f)) {
                str = "MIUI SDK版本过低";
                str2 = "请先升级MIUI SDK再运行本程序。是否现在升级？";
            } else {
                str = "MIUI SDK too old";
                str2 = "Please upgrade MIUI SDK and then re-run this application. Upgrade now?";
            }
            return k(str, str2, this.g, this.e);
        }
        if (Locale.CHINESE.getLanguage().equals(this.f)) {
            str = "MIUI SDK版本过低";
            str2 = "请先升级MIUI SDK再运行本程序。";
        } else {
            str = "MIUI SDK too old";
            str2 = "Please upgrade MIUI SDK and then re-run this application.";
        }
        return o(str, str2, this.e);
    }

    private Dialog p() {
        CharSequence charSequence;
        CharSequence charSequence2;
        if (Locale.CHINESE.getLanguage().equals(this.f)) {
            charSequence = "MIUI SDK正在更新";
            charSequence2 = "请稍候...";
        } else {
            charSequence = "MIUI SDK updating";
            charSequence2 = "Please wait...";
        }
        return ProgressDialog.show(this, charSequence, charSequence2, true, false);
    }

    private Dialog r() {
        String str;
        String str2;
        if (Locale.CHINESE.getLanguage().equals(this.f)) {
            str = "MIUI SDK更新完成";
            str2 = "请重新运行本程序。";
        } else {
            str = "MIUI SDK updated";
            str2 = "Please re-run this application.";
        }
        return o(str, str2, this.e);
    }

    private Dialog q() {
        String str;
        String str2;
        if (Locale.CHINESE.getLanguage().equals(this.f)) {
            str = "MIUI SDK更新失败";
            str2 = "请稍后重试。";
        } else {
            str = "MIUI SDK update failed";
            str2 = "Please try it later.";
        }
        return o(str, str2, this.e);
    }

    private boolean s() {
        try {
            return ((Boolean) c.C().getMethod("supportUpdate", new Class[]{Map.class}).invoke(null, new Object[]{null})).booleanValue();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private boolean t() {
        try {
            HashMap hashMap = new HashMap();
            return ((Boolean) c.C().getMethod("update", new Class[]{Map.class}).invoke(null, new Object[]{hashMap})).booleanValue();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
