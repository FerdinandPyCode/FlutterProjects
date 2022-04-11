import 'package:flutter/material.dart';
import 'package:socialnetwork/model/member.dart';

class ProfilePage extends StatefulWidget {
  late Member member;
  ProfilePage({Key? key, required this.member}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Profile Page"),
    );
  }
}
