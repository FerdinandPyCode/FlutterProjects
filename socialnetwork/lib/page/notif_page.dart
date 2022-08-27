import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:socialnetwork/model/inside_otif.dart';
import 'package:socialnetwork/model/member.dart';
import 'package:socialnetwork/tile/notif_tile.dart';
import 'package:socialnetwork/util/firebase_handler.dart';


class NotifPage extends StatefulWidget {
  Member member;

  NotifPage({Key? key, required this.member}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NotifState();

}

class NotifState extends State<NotifPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseHandler().fire_notif.doc(FirebaseHandler().authInstance.currentUser!.uid).collection("InsideNotif").snapshots(),
        builder: (context, snapshots) {
          if (snapshots.hasData) {
            final datas = snapshots.data!.docs;
            return ListView.separated(
                itemBuilder: (ctx, index) {
                  return NotifTile(notif: InsideNotif(datas[index]));
                },
                separatorBuilder: (ctx, index) {
                  return Divider();
                },
                itemCount: datas.length
            );
          } else {
            return const Center(child: Text("Aucune notif"),);
          }
        });
  }
}