import 'package:church_app/texteavecstyle.dart';
import 'package:church_app/widget/Enregistrement/toilette.dart';
import 'package:church_app/widget/agentpastoraux/agent.dart';
import 'package:church_app/widget/agentpastoraux/ajouter.dart';
import 'package:church_app/widget/bilan/bilan.dart';
import 'package:church_app/widget/location/location.dart';
import 'package:church_app/widget/personnels/ajouterpersonnel.dart';
import 'package:church_app/widget/personnels/personnel.dart';
import 'package:flutter/material.dart';
import 'Enregistrement/celebration.dart';
import 'Enregistrement/depense.dart';
import 'Enregistrement/enregistrer.dart';
import 'Enregistrement/quete.dart';
import 'Enregistrement/vente.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  late ValueNotifier<int> npage=ValueNotifier(0);
  @override
  void initState() {
    npage.value = 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: npage,
      builder: (context,value,child){
        return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 240.0,
              color: Colors.blue[50],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  drawerWidget(0,"Enregistrement",Icons.add_outlined),
                  drawerWidget(2,"Agent Pastoraux",Icons.group),
                  drawerWidget(1,"Personnels",Icons.person),
                  drawerWidget(3,"Locations",Icons.home_outlined),
                  drawerWidget(4,"Bilan",Icons.dashboard),
                ],
              ),
            ),

            Expanded(
              child: (value==0) ?  Enregistrer(npage:npage):
                      (value==1) ? Personnels(npage:npage):
                      (value==2) ? AgentPastoraux(npage:npage):
                      (value==3) ? Location(npage:npage):
                      (value==4) ? Bilan(npage:npage):
                      (value==5) ? const Celebration() :
                      (value==6) ? const Vente() :
                      (value==7) ? const Quete() :
                      (value==8) ? const Depense() :
                      (value==9) ? const Toilette() :
                      (value==10) ? const AjoutAgentPastoraux() :
                      (value==13) ? const AjoutPersonnel() :
                      Center(
                        child: TexteAvecStyle("Cette option n'existe pas !!!!"),
                      )
            )
          ],
        );
      }
    );
  }

Widget drawerWidget(int page,String title,IconData data){
  return Padding(
  padding: const EdgeInsets.all(12.0),
  child: ElevatedButton.icon(
    onPressed: (){
      setState(() {
        npage.value=page;
      });
    },
    icon: Icon(data),
    label: TexteAvecStyle(
      title,
      fontSize: 20.0,
      color: Colors.white,
      ),
      style: ElevatedButton.styleFrom(
        animationDuration:const Duration(milliseconds: 1000),
        alignment: Alignment.centerLeft,
        fixedSize:const Size(220, 50),
        primary: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        textStyle:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
        ),
      ),
    );
  }
}