import 'package:caisse/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser{
  late String uid;
  late String name;
  late String surname;
  late double amount;
  late String email;
  late String imageUrl='';
  late DocumentReference ref;
  late String documentId;

  User(DocumentSnapshot snapshot) {
    ref = snapshot.reference;
    uid = snapshot.id;
    Object? datas = snapshot.data();
    datas = datas as Map;
    amount=datas[amountKey];
    name = datas[nameKey];
    email=datas[emailKey];
    surname = datas[surnameKey];
    imageUrl = datas[imageUrlKey];
  }


  Map<String,dynamic> toMap() {
    return {
      uidKey: uid,
      nameKey: name,
      surnameKey: surname,
      amountKey: amount,
      emailKey: email,
      imageUrlKey: imageUrl,
      
    };
  }
}