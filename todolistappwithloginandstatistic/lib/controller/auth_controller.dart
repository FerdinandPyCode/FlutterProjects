import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolistappwithloginandstatistic/custom_widget/my_textfield.dart';
import 'package:todolistappwithloginandstatistic/custom_widget/padding_with.dart';
import 'package:todolistappwithloginandstatistic/model/alerte_helper.dart';
import '../custom_widget/my_gradient.dart';
import '../model/alerte_helper.dart';

class AuthController extends StatefulWidget {
  const AuthController({Key? key}) : super(key: key);
  @override
  State<AuthController> createState() => _AuthControllerState();
}

class _AuthControllerState extends State<AuthController> {
  late TextEditingController _pseudo;
  late TextEditingController _password;
  late TextEditingController _name;
  late TextEditingController _surname;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    _pseudo = TextEditingController();
    _surname = TextEditingController();
    _password = TextEditingController();
    _name = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _pseudo.dispose();
    _name.dispose();
    _password.dispose();
    _surname.dispose();
    _pageController.dispose();
    super.dispose();
  }

  hidekeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: InkWell(
            onTap: () {
             // hidekeyboard();
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.height > 700)
                  ? MediaQuery.of(context).size.height
                  : 700,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    
                    Container(
                      width: 300,
                      height: 50,
                      child:const Text(
                        "Page d'inscription",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.0
                        ),
                      )
                    ),
                   
                    logCard(),
                      
                    PaddingWith(
                        child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: MyGradient(
                          horizontal: true,
                          radius: 25.0,
                          startColor:Colors.green,
                          endColor: Colors.white),
                      child: TextButton(
                        onPressed: () {
                          verifierInfo();
                        },
                        child: const Center(
                          child: Text(
                            "C'est parti !", /*style: TextStyle(backgroundColor: Colors.teal)*/
                          ),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }

  Widget logCard() {
    List<Widget> list = [];
      list.add(MyTextField(
        controller: _surname,
        hint: "Entrez votre prénom",
      ));

      list.add(MyTextField(
        controller: _name,
        hint: "Entrez votre nom",
      ));

    list.add(MyTextField(
      controller: _pseudo,
      hint: "Pseudo",
    ));
    list.add(MyTextField(
      controller: _password,
      hint: "Mot de passe",
      obscure: true,
    ));
    return PaddingWith(
      child: Center(
        child: Card(
          elevation: 7.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: list,
          ),
        ),
      ),
    );
  }

  verifierInfo() {
    //hidekeyboard();

    String name = _name.text;
    String surname = _surname.text;
    String mail = _pseudo.text;
    String pwd = _password.text;

    if ((validText(mail)) && (validText(pwd)) && (validText(name)) && (validText(surname))) {
      connectedState();
    } else{
      //Alerte user . Pas de mail ou pas de mot de passe
      AlerteHelper().error(context, "Veuillez remplir tout les champs inexistant");
    }

  }

  bool validText(String string) {
    return (string != null && string != "");
  }

  connectedState() async{
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.setBool("connected",true);
    });
    
  }
}