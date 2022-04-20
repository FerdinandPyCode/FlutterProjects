import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolistappwithloginandstatistic/controller/auth_controller.dart';
import 'package:todolistappwithloginandstatistic/controller/main_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Flutter Todo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
bool? connected;
late SharedPreferences prefs;

@override
  void initState(){
    verifyIConnected();
  }

verifyIConnected() async{
  final prefs = await SharedPreferences.getInstance();
  setState(() {
    connected = prefs.getBool("connected");
  });
}

@override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body : (connected!=null) ? MainController() : AuthController()
    );
  }

}
