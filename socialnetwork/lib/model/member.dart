import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socialnetwork/util/constants.dart';

class Member {
  late String uid;
  late String name;
  late String surname;
  late String imageUrl;
  late List<dynamic> followers;
  late List<dynamic> following;
  late DocumentReference ref;
  late String documentId;
  late String description;

  Member(DocumentSnapshot snapshot) {
    ref = snapshot.reference;
    uid = snapshot.id;
    Object? datas = snapshot.data();
    datas = datas as Map;

    name = datas[nameKey];
    surname = datas[surnameKey];
    imageUrl = datas[imageUrlKey];
    followers = datas[followersKey];
    following = datas[followingKey];
    description =
        (datas[descriptionKey] == null) ? "Powerful" : datas[descriptionKey];
  }
  Map<String, dynamic> toMap() {
    return {
      uidKey: uid,
      nameKey: name,
      surnameKey: surname,
      followingKey: following,
      followersKey: followers,
      imageUrlKey: imageUrl,
      descriptionKey: description
    };
  }
}
