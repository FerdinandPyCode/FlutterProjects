import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialnetwork/custom_widget/my_textfield.dart';
import 'package:socialnetwork/custom_widget/post_content.dart';
import 'package:socialnetwork/model/member.dart';
import 'package:socialnetwork/model/post.dart';
import 'package:socialnetwork/util/constants.dart';
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

  Future<void> writeAComment(BuildContext context, {required Post post, required TextEditingController commentController, required member}) async{
    MyTextField commentTextField = MyTextField(controller: commentController, hint: "Ectivez un commentaire",);
    Text title = Text("Nouveau Commentaire");
    return showDialog(context: context, builder: (BuildContext ctx) {
      return AlertDialog(
        title: title,
        content: SingleChildScrollView(
          child: Column(
            children: [
              PostContent(member: member, post: post,),
              commentTextField,
            ],

          )
        ),
        actions: [
          close(context, "Annuler"),
          TextButton(
              onPressed: () {
                if (commentController.text != null && commentController.text != "") {
                  FirebaseHandler().addComment(post, commentController.text);
                  Navigator.pop(context);
                }
              },
              child: Text("Valider"))
        ],
      );
    });
  }

    Future<void> changeUser(
      BuildContext context, {
        required Member member,
        required TextEditingController name,
        required TextEditingController surname,
        required TextEditingController desc
        }
      ) async {
        MyTextField nameTF = MyTextField(controller: name, hint: member.name,);
        MyTextField surnameTF = MyTextField(controller: surname, hint: member.surname,);
        MyTextField descTF = MyTextField(controller: desc, hint: member.description ?? "Aucune description",);
        Text text = const Text("Modification des données");
        return showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return AlertDialog(
                title:  text,
                content: Column(
                  children: [nameTF, surnameTF, descTF],
                ),
                actions: [
                  close(context, "Annuler"),
                TextButton(
                  child: const Text("Valider"),
                  onPressed: () {
                    Map<String, dynamic> datas = {};
                    if (name.text != null && name.text != "") {
                      datas[nameKey] = name.text;
                    }
                    if (surname.text != null && surname.text != "") {
                      datas[surnameKey] = surname.text;
                    }
                    if (desc.text != null && desc.text != "") {
                      datas[descriptionKey] = desc.text;
                    }
                    FirebaseHandler().modifyMember(datas, member.uid);
                    Navigator.pop(context);
                  },
                )
                ],
              );
            });
      }
}
