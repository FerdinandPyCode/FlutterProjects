import 'dart:math';

import 'todoprovider.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/tache.dart';
import 'dateconverter.dart';
import 'tache.dart';

class Formulaire extends StatefulWidget {
  Formulaire({Key? key}) : super(key: key);

  @override
  _FormulaireState createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
  final _formkey = GlobalKey<FormState>();
  String titre="";
  String description="";
  int dateenreg=0;
  int datebegin=0;
  int dateend=0;

  String date="";
  String sdate="";
  String heureD="";
  String heureF="";
  String dateD="";
  String dateF="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Formulaire d'enregistrement",
          ),
          centerTitle: true,
          elevation: 10.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding:
            const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                    child: Text(
                      "Formulaire d'enregistrement",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "Entrer le titre",
                      border: OutlineInputBorder(),
                    ),
                    validator: (val) =>
                    val!.isEmpty
                        ? 'Entrez un titre svp :)'
                        : null,
                    onChanged: (val) => titre = val,
                  ),
                  const SizedBox(height: 10.0,),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "La description",
                      border: OutlineInputBorder(),
                    ),
                    validator: (val) =>
                    val!.isEmpty
                        ? 'Entrez la description :)'
                        : null,
                    onChanged: (val) => description = val,
                  ),
                  const SizedBox(height: 10.0,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: (() => montrerPicker(0)),
                    child: Text(

                      (dateD=="") ? "Date Début": dateD,
                      style:const TextStyle(
                          color: Colors.white
                      ),
                    ),

                  ),
                  const SizedBox(height: 10.0,),
                  //buildTimeField(context),
                  TextButton(
                    child: Text(
                      (heureD=="") ? 'Heure Début': heureD,
                    ),
                    onPressed: () async {
                      // 1
                      var timeOfDay = await showTimePicker(
                        // 2
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );

                      // 3
                      setState(() {
                        if (timeOfDay != null) {
                          setState(() {
                            heureD=timeOfDay.format(context);
                            date += heureD;
                            print("date de debut avant le split                             $date");
                            datebegin=Converter.dateToInt(date);
                          });
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 10.0,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: (() => montrerPicker(1)),
                    child: Text(

                      (dateF=="") ? "Date Fin": dateF,
                      style:const TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  //buildTimeField(context),
                  TextButton(
                    child: Text(
                      (heureF=="") ? 'Heure Fin': heureF,
                    ),
                    onPressed: () async {
                      // 1
                      var timeOfDay = await showTimePicker(
                        // 2
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );

                      // 3
                      setState(() {
                        if (timeOfDay != null) {
                          setState(() {
                            heureF=timeOfDay.format(context);
                            sdate += heureF;
                            print("date de fin avant le split                             $sdate");
                            dateend=Converter.dateToInt(sdate);
                          });
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 20.0,),
                  Center(
                    child: ElevatedButton(
                        onPressed: () async {

                          setState(() {
                            DateTime d=DateTime.now();
                            dateenreg=Converter.dateToInt(d.toString());
                          });

                          if(titre=="" || description=="" || datebegin==0 || dateend==0 || dateenreg==0){
                            alerte('Veuillez renseigner tous les champs svp !!\nVerifiez également les dates');

                          }else{

                            if(dateend<dateenreg){
                              
                              alerte("Date invalide !!!!!!!!");
                            }else{
                              print("Date begin   ++++++++++++     $datebegin");
                              print("Date end    -----------    $dateend");
                              print("Date enreg    -----------    $dateenreg");
                              print("description    -----------    $description");
                              print("titre    -----------    $titre");
                              print("status    -----------    0");
                             await DatabaseHandler()
                            .insertTodo(Todo(
                            id:1+ Random().nextInt(50),
                            titre: titre,
                            description: description,
                            datebegin: datebegin,
                            dateenreg: dateenreg,
                            dateend: dateend,
                            status: 0,
                            ))
                            .whenComplete(() => Navigator.pop(context));
                            }

                          }
                        },
                        child: const Text(
                          "Enregistrer",
                        ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Future montrerPicker(int n) async {
    DateTime? choix = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025)
      //initialDatePickerMode: DatePickerMode.year,
    );

    if (choix != null) {
      if(n==0){
        setState(() {
          date = choix.toString().substring(0,11);
          dateD=date;
          print("date debut sssssssssss $date");
        });

      }else{
        setState(() {
          sdate = choix.toString().substring(0,11);
          dateF=sdate;
          print("date debut sssssssssss $sdate");
        });
      }

    }
  }

  Future<Null> alerte(String t) async{
    return showDialog(
        context: context,
        builder: (BuildContext buildcontext){
          return AlertDialog(
            title: const Text('Formulaire de Tâche'),
            content: Text(t),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,//(genre) ? Colors.blue : Colors.pink, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: (){
                  Navigator.pop(buildcontext);
                },
                child:const Text("OK",style: TextStyle(color: Colors.green),),
              ),
            ],
          );
        }
    );
  }
}
