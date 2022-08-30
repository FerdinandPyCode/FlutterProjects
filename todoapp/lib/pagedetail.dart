import 'package:flutter/material.dart';
import 'tache.dart';

class PageDetail extends StatelessWidget {

  late Todo item;

  PageDetail(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (
          AppBar(
            title:const Text("Détail de la tâche"),
            centerTitle: true,
          )
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Text(
                item.titre,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontStyle: FontStyle.italic
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  top: 18.0, left: 10.0, right: 10.0, bottom: 5.0),
              child: Text(
                item.description,
                //textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontStyle: FontStyle.normal
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0,left: 5.0,bottom: 20.0),
                  child: Text(
                    "$item.datebegin",
                    //textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 15.0,
                        //fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0,bottom: 20.0),
                  child: Text(
                    "à",
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.0,
                        //fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0,right: 5.0,bottom: 20.0),
                  child: Text(
                    "$item.dateend",
                    //textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 15.0,
                        //fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: (item.status == 0) ? TexteAvecStyle(
                  "Déjà fait", color: Colors.green) : (item.status == 1)
                  ? TexteAvecStyle("En cours", color: Colors.blueAccent)
                  : TexteAvecStyle("En Attente ...", color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  Text TexteAvecStyle(data, {textAlign: TextAlign.center, color: Colors
      .indigo, fontSize: 15.0, fontStyle: FontStyle.italic}) {
    return Text(
      data,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontStyle: fontStyle
      ),
    );
  }
}