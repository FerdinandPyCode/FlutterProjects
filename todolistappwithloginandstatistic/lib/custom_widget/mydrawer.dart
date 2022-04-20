import 'package:flutter/material.dart';
class MyDrawer extends StatefulWidget {
  const MyDrawer({ Key? key }) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            Container(
              height: 120.0,
              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Center(
                    child: CircleAvatar(
                      radius: 35.0,
                      backgroundColor: Colors.white,
                      child: Text(
                        "JD",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 25.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "John Doe",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20.0,),
            const Card(
              elevation: 3.0,
              margin: EdgeInsets.all(6.0),
              child: ListTile(
                //leading: Icon(Icons.home),

                title: Text(
                  'Accueil',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                
              ),
              
            ),
            const Card(
              elevation: 3.0,
              margin: EdgeInsets.all(6.0),
              child: ListTile(
                //leading: Icon(Icons.),

                title: Text(
                  'Liste des tâches',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Card(
              margin: EdgeInsets.all(6.0),
              elevation: 3.0,
              child: ListTile(
                title: Text(
                  'Paramètres',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Card(
              margin: EdgeInsets.all(6.0),
              elevation: 3.0,
              child: ListTile(
                title: Text(
                  'Déconnexion',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                  //trailing: Icon(Icons.more_vert),
                ),
              ),
            ),
          ],
        ),
      );
  }
}