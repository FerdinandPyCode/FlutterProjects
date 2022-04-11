import "package:flutter/material.dart";
import 'package:socialnetwork/model/member.dart';

class NotifPage extends StatefulWidget {
  late Member member;
  NotifPage({Key? key, required this.member}) : super(key: key);

  @override
  _NotifPageState createState() => _NotifPageState();
}

class _NotifPageState extends State<NotifPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Notif Page"),
    );
  }
}
