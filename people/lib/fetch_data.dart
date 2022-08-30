import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:people/model.dart';


class FetchData{

String urlString = "https://ifri.raycash.net/getusers";
 List<Human> mylist=[];

Future<List<Human>> fetchPeople() async {
  
  final response = await http.get(Uri.parse(urlString));
  //final response = await http.get(Uri.parse(urlString));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print("------------La c'est dans un instant---------------");

    print("------------> ${jsonDecode(response.body)["message"]}");

    var total=jsonDecode(response.body)["message"] as List;

    total.forEach((element) {

        mylist.add(Human.fromMap(element));
        
     });

    return mylist;

  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print("Une erreur est subvénu ohhhhhhhhhhhh");
    throw Exception('Failed to load album');
  }
}

}