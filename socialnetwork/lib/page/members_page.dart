import 'package:flutter/material.dart';
import 'package:socialnetwork/model/member.dart';

class MembersPage extends StatefulWidget {
  late Member member;
  MembersPage({Key? key, required this.member}) : super(key: key);

  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Members Page"));
  }
}
