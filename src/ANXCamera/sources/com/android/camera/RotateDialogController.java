package com.android.camera;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnKeyListener;
import android.support.v7.recyclerview.R;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.CheckBox;
import android.widget.TextView;

public class RotateDialogController {
    public static AlertDialog showSystemAlertDialog(Context context, String title, String msg, String button1Text, final Runnable r1, String button2Text, final Runnable r2) {
        Builder builder = new Builder(context);
        builder.setTitle(title);
        builder.setMessage(msg);
        builder.setCancelable(false);
        if (button1Text != null) {
            builder.setPositiveButton(button1Text, new OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    if (r1 != null) {
                        r1.run();
                    }
                }
            });
        }
        if (button2Text != null) {
            builder.setNegativeButton(button2Text, new OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    if (r2 != null) {
                        r2.run();
                    }
                }
            });
        }
        AlertDialog ad = builder.create();
        ad.show();
        return ad;
    }

    public static AlertDialog showSystemChoiceDialog(Context context, String title, String msg, String choiceContent, String buttonText, final Runnable checkrun, final Runnable uncheckrun) {
        OnKeyListener listener = new OnKeyListener() {
            public boolean onKey(DialogInterface dialog, int keyCode, KeyEvent event) {
                return keyCode == 25 || keyCode == 24;
            }
        };
        Builder builder = new Builder(context);
        View message = LayoutInflater.from(context).inflate(R.layout.v6_choice_alertdialog, null);
        ((TextView) message.findViewById(R.id.alert_declaration)).setText(msg);
        final CheckBox choice = (CheckBox) message.findViewById(R.id.alert_declaration_checkbox);
        choice.setText(choiceContent);
        builder.setOnKeyListener(listener);
        builder.setTitle(title);
        builder.setCancelable(false);
        builder.setView(message);
        if (buttonText != null) {
            builder.setPositiveButton(buttonText, new OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    if (choice.isChecked()) {
                        if (checkrun != null) {
                            checkrun.run();
                        }
                    } else if (uncheckrun != null) {
                        uncheckrun.run();
                    }
                }
            });
        }
        AlertDialog ad = builder.create();
        ad.show();
        return ad;
    }
}
