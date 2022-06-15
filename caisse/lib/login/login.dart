import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        child:Column(
          children: [
            //const Text("Email",style:TextStyle(fontSize: 10),),
            TextField(
              controller: _controller1,
              decoration:const InputDecoration(
                hintText: "email",
                label: Text("Email"),
              ),
            ),
            //const Text("Password",style:TextStyle(fontSize: 10),),
            TextField(
              controller: _controller2,
              decoration:const InputDecoration(
                hintText: "password",
                label: Text("Password"),
              ),
            ),
            const TextButton(
              onPressed: null, 
              child: Text("Valider"),
            ),
          ],
        )),
    );
  }
}