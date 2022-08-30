import 'dart:convert';

import 'package:whatsappclone/models/appel.dart';


AppelList callListFromJson(String str) {
  var jsonData = json.decode(str);
  return AppelList.fromJson(jsonData);
}

class AppelList {
  List<Appel> appels;

  AppelList({
    required this.appels,
  });

  factory AppelList.fromJson(List<dynamic> json) {
    List<Appel> appels = json.map<Appel>((i) => Appel.fromJson(i)).toList();

    return AppelList(
      appels: appels,
    );
  }
}