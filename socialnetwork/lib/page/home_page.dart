import "package:flutter/material.dart";
import 'package:socialnetwork/model/member.dart';

class HomePage extends StatefulWidget {
  late Member member;
  HomePage({Key? key, required this.member}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Home page"),
    );
  }
}
