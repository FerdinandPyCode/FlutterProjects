import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dbhelper.dart';
import 'model.dart';
import 'dateconverter.dart';

class EdditScreen extends StatefulWidget {

  late Human item;
  EdditScreen(this.item, {Key? key}) : super(key: key);


  @override
  _EdditScreenState createState() => _EdditScreenState(item);
}

class _EdditScreenState extends State<EdditScreen> {
  
  late Human item;
  _EdditScreenState(this.item);

  final _formKey = GlobalKey<FormState>();

  String firstname = "";
  String lastname = "";
  String adress = "";
  String phone = "";
  String mail = "";
  String gender = "Masculin";
  String picture = "assets/profile.png";
  String citation = "";
  int birthday = 0;
  String date = "";
  String msg = "";
  String msg2="";

  String dropdownvalue = 'Masculin';
  var items = [
    'Masculin',
    'Féminin',
  ];

   @override
  void initState() {
    super.initState();
    firstname=item.firstname;
    lastname=item.lastname;
    adress=item.adress;
    phone=item.phone;
    mail=item.mail;
    gender=item.gender;
    picture=item.picture;
    citation=item.citation;
    birthday=item.birthday;
    date=Converter.intToString(item.birthday);
    dropdownvalue=item.gender;
    if(picture=='assets/2.png'){
      msg="Choose profile";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change personal Informations'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin:const EdgeInsets.only(top:5.0,bottom: 5.0),
                  child: const Text(
                    "Firsname",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 15.0
                    ),
                    ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your firstname';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: item.firstname,
                    //labelText: "Firstname",
                    border:const OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                    
                      firstname = value;
                    });
                  },
                ),
                
                const SizedBox(height: 10.0,),
                Container(
                  margin:const EdgeInsets.only(top:5.0,bottom: 5.0),
                  child: const Text(
                    "Lastname",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 15.0
                    ),
                    ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your lastname';
                    }
                    return null;
                  },
                  decoration:InputDecoration(
                    hintText: item.lastname,
                    //labelText: "Lastname",
                    border:  const OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      lastname = value;
                    });
                  },
                ),

                const SizedBox(height: 10.0,),
                Container(
                  margin:const EdgeInsets.only(top:5.0,bottom: 5.0),
                  child: const Text(
                    "Adress",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 15.0
                    ),
                    ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your adress';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                  
                    hintText: item.adress,
                    //labelText: "Adress",
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      adress = value;
                    });
                  },
                ),

                const SizedBox(height: 10.0,),
                Container(
                  margin:const EdgeInsets.only(top:5.0,bottom: 5.0),
                  child: const Text(
                    "Phone number",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 15.0
                    ),
                    ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: item.phone,
                    //labelText: "Phone",
                    border:const OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      phone = value;
                    });
                  },
                ),

                const SizedBox(height: 10.0,),
                Container(
                  margin:const EdgeInsets.only(top:5.0,bottom: 5.0),
                  child: const Text(
                    "Email",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 15.0
                    ),
                    ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mail address';
                    }
                    return null;
                  },
                 ///// keyboardType: ,
                  decoration: InputDecoration(
                    
                    hintText: item.mail,
                    //labelText: "Email",
                    border:const OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      mail = value;
                    });
                  },
                ),

                const SizedBox(height: 10.0,),

                Container(
                  margin:const EdgeInsets.only(top:5.0,bottom: 5.0),
                  child: const Text(
                    "Gender",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 15.0
                    ),
                    ),
                ),

                DropdownButton(
                
                  // Initial Value
                  value: item.gender,
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),    
                    
                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) { 
                    setState(() {
                      dropdownvalue = newValue!;
                      gender=dropdownvalue;
                    });
                  },
              ),

                const SizedBox(height: 10.0,),
                Container(
                  margin:const EdgeInsets.only(top:5.0,bottom: 5.0),
                  child: const Text(
                    "Citation",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 15.0
                    ),
                    ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your citation';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: item.citation,
                    //labelText:"Citation",
                    border:const OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      citation = value;
                    });
                  },
                ),

              const SizedBox(height: 10.0,),

              Container(
                  margin:const EdgeInsets.only(top:5.0,bottom: 5.0),
                  child: const Text(
                    "Birthday",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 15.0
                    ),
                    ),
                ),

              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  side:const BorderSide(width: 1, color: Colors.green),
                  
                ),
                onPressed:(() => montrerPicker()),
                  child:Text(
                  (date=="") ? "Birthday" : date.substring(0,11),
                  style:const TextStyle(
                      fontSize: 18.0
                  ),
                ),
                ),
                
                Center(
                  child: Text(
                    (msg=="") ? "" : "Please enter your birthday !",
                    textAlign: TextAlign.center,
                    style:const TextStyle(
                      color: Colors.red,
                      fontSize: 13.0
                    ),
                  ),
                ),

                const SizedBox(height: 20.0,),
                OutlinedButton(
                
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  side:const BorderSide(width: 1, color: Colors.green),
                ),
                onPressed:(() => pickImageFromGallery()),
                  child:Text(
                  (msg2=="") ? "Your picture" : msg2,
                  style:const TextStyle(
                      fontSize: 18.0
                  ),
                ),
                ),

                const SizedBox(height: 20.0,),

                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Annuler',
                    style: TextStyle(
                    fontSize: 20,
                    ),
                  ),
                  style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.lightGreen;
                      }
                      return null; // Defer to the widget's default.
                    }),
                foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.white;
                      }
                      return null; // Defer to the widget's default.
                    }),
              ),
                ),

                const SizedBox(height: 20.0,),
                ElevatedButton(
                  onPressed: () async {
                      await DatabaseHandler()
                        .insertpeople(Human(
                        firstname: firstname,
                        lastname: lastname,
                        id: item.id,
                        birthday: birthday,
                        adress: adress,
                        phone: phone,
                        mail: mail,
                        gender: gender,
                        picture: picture,
                        citation: citation
                        ))
                        .whenComplete(() => Navigator.pop(context)
                    );
                  },
                  child: const Text(
                    'Enregistrer',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

    Future montrerPicker() async {
    DateTime? choix = await showDatePicker(
      context: context,
      initialDate: DateTime(2010),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
    );

    if (choix != null) {
        setState(() {
          date=choix.toString().substring(0,11);
          birthday = Converter.dateToInt(choix.toString());
        });
    }
  }
  Future<void> pickImageFromGallery() async{

    final ImagePicker _picker = ImagePicker();

    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      setState(() {
        picture = image.path;
        msg2="myprofile.png";
      });
    }
  }
}