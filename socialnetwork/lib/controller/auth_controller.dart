import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialnetwork/custom_widget/my_gradient.dart';
import 'package:socialnetwork/custom_widget/my_textfield.dart';
import 'package:socialnetwork/custom_widget/padding_with.dart';
import 'package:socialnetwork/model/alerte_helper.dart';
import 'package:socialnetwork/model/color_theme.dart';
import 'package:socialnetwork/model/my_painter.dart';
import 'package:socialnetwork/util/firebase_handler.dart';
import 'package:socialnetwork/util/images.dart';

class AuthController extends StatefulWidget {
  const AuthController({Key? key}) : super(key: key);

  @override
  State<AuthController> createState() => _AuthControllerState();
}

class _AuthControllerState extends State<AuthController> {
  late TextEditingController _mail;
  late TextEditingController _password;
  late TextEditingController _name;
  late TextEditingController _surname;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    _mail = TextEditingController();
    _surname = TextEditingController();
    _password = TextEditingController();
    _name = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _mail.dispose();
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
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: InkWell(
            onTap: () {
              hidekeyboard();
            },
            child: Container(
              decoration: MyGradient(
                startColor: ColorTheme.pointer(),
                endColor: ColorTheme.base(),
              ),
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.height > 700)
                  ? MediaQuery.of(context).size.height
                  : 700,
              child: SafeArea(
                child: Column(
                  children: [
                    PaddingWith(
                      child: Image.asset(
                        logoImage,
                        height: MediaQuery.of(context).size.height / 5,
                      ),
                    ),
                    logOrCreateButtons(),
                    Expanded(
                      child: PageView(
                        controller: _pageController,
                        children: [logCard(true), logCard(false)],
                      ),
                      flex: 2,
                    ),
                    PaddingWith(
                        child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: MyGradient(
                          horizontal: true,
                          radius: 25.0,
                          startColor: ColorTheme.accent(),
                          endColor: ColorTheme.pointer()),
                      child: TextButton(
                        onPressed: () {
                          authToFirebase();
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
      ),
    );
  }

  Widget logOrCreateButtons() {
    return Container(
      width: 300,
      height: 50,
      decoration: MyGradient(
          horizontal: true,
          startColor: ColorTheme.base(),
          endColor: ColorTheme.pointer(),
          radius: 20),
      child: CustomPaint(
        painter: MyPainter(pageController: _pageController),
        child: Row(
          children: [
            btn("Se Connecter"),
            btn("Créer un compte"),
          ],
        ),
      ),
    );
  }

  Expanded btn(String name) {
    return Expanded(
        child: TextButton(
            child: Text(name),
            onPressed: () {
              int page = (_pageController.page == 0.0) ? 1 : 0;
              _pageController.animateToPage(page,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            }));
  }

  Widget logCard(bool userExists) {
    List<Widget> list = [];
    if (!userExists) {
      list.add(MyTextField(
        controller: _surname,
        hint: "Entrez votre prénom",
      ));
      list.add(MyTextField(
        controller: _name,
        hint: "Entrez votre nom",
      ));
    }
    list.add(MyTextField(
      controller: _mail,
      hint: "Adresse mail",
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

  authToFirebase() {
    hidekeyboard();
    bool signIn = (_pageController.page == 0);
    String name = _name.text;
    String surname = _surname.text;
    String mail = _mail.text;
    String pwd = _password.text;

    if ((validText(mail)) && (validText(pwd))) {
      if (signIn) {
        //Méthode vers firebase
        FirebaseHandler().signIn(mail, pwd);
      } else {
        if ((validText(name)) && (validText(surname))) {
          //Méthode vers firebase
          FirebaseHandler().createUser(mail, pwd, name, surname);
        } else {
          //Alerte nom et prenom
          AlerteHelper().error(context, "Nom ou prénom inexistant");
        }
      }
    } else {
      //Alerte user . Pas de mail ou pas de mot de passe
      AlerteHelper().error(context, "Mot de passe ou mail inexistant");
    }
  }

  bool validText(String string) {
    return (string != null && string != "");
  }
}
