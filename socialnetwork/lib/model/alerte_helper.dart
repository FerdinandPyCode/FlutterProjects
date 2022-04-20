import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialnetwork/util/firebase_handler.dart';

class AlerteHelper {
  Future<void> error(BuildContext context, String error) async {
    bool isiOS = (Theme.of(context).platform == TargetPlatform.iOS);
    const title = Text('Erreur');
    final explanation = Text(error);
    return showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return (isiOS)
              ? CupertinoAlertDialog(
                  title: title,
                  content: explanation,
                  actions: [close(ctx, "Ok")],
                )
              : AlertDialog(
                  title: title,
                  content: explanation,
                  actions: [close(ctx, "OK")],
                );
        });
  }

  TextButton close(BuildContext context, String string) {
    return TextButton(
      onPressed: (() => Navigator.pop(context)),
      child: Text(string),
    );
  }

  Future<Future> disconnect(BuildContext context) async {
    bool isiOS = (Theme.of(context).platform == TargetPlatform.iOS);
    Text title = const Text("Voulez vous vous deconnecter ?");
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return isiOS
              ? CupertinoAlertDialog(
                  title: title,
                  actions: [
                    close(context, "NON"),
                    disconnectBtn(
                      context,
                    )
                  ],
                )
              : AlertDialog(
                  title: title,
                  actions: [
                    close(context, "NON"),
                    disconnectBtn(
                      context,
                    )
                  ],
                );
        });
  }

  TextButton disconnectBtn(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pop(context);
          FirebaseHandler().logOut();
        },
        child: const Text("OUI"));
  }
}
