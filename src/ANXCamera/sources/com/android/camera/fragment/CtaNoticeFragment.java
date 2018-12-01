package com.android.camera.fragment;

import android.app.Dialog;
import android.app.DialogFragment;
import android.app.FragmentManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.recyclerview.R;
import android.text.SpannableStringBuilder;
import android.text.method.LinkMovementMethod;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.ui.UrlSpan;
import com.android.camera.ui.UrlSpan.UrlSpanOnClickListener;
import java.util.Locale;
import miui.app.AlertDialog;
import miui.app.AlertDialog.Builder;

public class CtaNoticeFragment extends DialogFragment {

    public static class CTA {
        private static boolean sCanConnectToNetworkTemp = false;

        public static boolean canConnectNetwork() {
            if (sCanConnectToNetworkTemp) {
                return true;
            }
            return ((DataItemGlobal) DataRepository.provider().dataGlobal()).getCTACanCollect();
        }

        public static void setCanConnectNetwork(boolean remindNever) {
            if (remindNever) {
                ((DataItemGlobal) DataRepository.provider().dataGlobal()).setCTACanCollect(true);
            } else {
                sCanConnectToNetworkTemp = true;
            }
        }
    }

    static class Licence {
        private static String URL_MIUI_PRIVACY_POLICY = "http://www.miui.com/res/doc/privacy.html";
        private static String URL_MIUI_USER_AGREEMENT = "http://www.miui.com/res/doc/eula.html";

        Licence() {
        }

        public static Intent getUserAgreementIntent() {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(Uri.parse(getUrlByLocale(URL_MIUI_USER_AGREEMENT)));
            return intent;
        }

        public static Intent getPrivacyIntent() {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(Uri.parse(getUrlByLocale(URL_MIUI_PRIVACY_POLICY)));
            return intent;
        }

        private static String getUrlByLocale(String url) {
            return url + "?lang=" + (Locale.getDefault().getLanguage().equals("zh") ? "zh_CN" : "en_US");
        }
    }

    public static boolean checkCta(FragmentManager fragmentManager) {
        if (CTA.canConnectNetwork()) {
            return true;
        }
        new CtaNoticeFragment().show(fragmentManager, "CtaNoticeFragment");
        return false;
    }

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setCancelable(false);
    }

    public Dialog onCreateDialog(Bundle savedInstanceState) {
        return new Builder(getActivity()).setTitle(R.string.user_notice_title).setMessage(buildUserNotice(getActivity(), R.string.user_notice_identify_summary_format)).setPositiveButton(R.string.user_agree, new OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {
                CTA.setCanConnectNetwork(((AlertDialog) CtaNoticeFragment.this.getDialog()).isChecked());
            }
        }).setNegativeButton(17039360, new OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {
            }
        }).setCheckBox(true, getActivity().getString(R.string.do_not_remind_me)).create();
    }

    public void onStart() {
        super.onStart();
        ((AlertDialog) getDialog()).getMessageView().setMovementMethod(LinkMovementMethod.getInstance());
    }

    private static SpannableStringBuilder buildUserNotice(final Context context, int userNoticeMessageFormat) {
        Resources res = context.getResources();
        String userAgreement = res.getString(R.string.user_agreement2);
        String privacyPolicy = res.getString(R.string.user_agreement4);
        String message = res.getString(userNoticeMessageFormat, new Object[]{userAgreement, privacyPolicy});
        UrlSpanOnClickListener agreementUrlClickListener = new UrlSpanOnClickListener() {
            public void onClick() {
                context.startActivity(Licence.getUserAgreementIntent());
            }
        };
        UrlSpanOnClickListener privacyUrlClickListener = new UrlSpanOnClickListener() {
            public void onClick() {
                context.startActivity(Licence.getPrivacyIntent());
            }
        };
        SpannableStringBuilder userNotice = new SpannableStringBuilder(message);
        int start = message.indexOf(userAgreement);
        userNotice.setSpan(new UrlSpan(agreementUrlClickListener), start, userAgreement.length() + start, 33);
        start = message.indexOf(privacyPolicy);
        userNotice.setSpan(new UrlSpan(privacyUrlClickListener), start, privacyPolicy.length() + start, 33);
        return userNotice;
    }
}
