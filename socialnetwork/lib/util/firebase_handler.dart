import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;

import '../model/post.dart';
import 'constants.dart';

class FirebaseHandler {
  //Authentification
  final authInstance = FirebaseAuth.instance;

  //Connexion
  Future<User?> signIn(String mail, String pwd) async {
    final userCredential = await authInstance.signInWithEmailAndPassword(
        email: mail, password: pwd);
    final User? user = userCredential.user;
    return user;
  }

  //Creation user
  Future<User?> createUser(
      String mail, String pwd, String name, String surname) async {
    final userCredential = await authInstance.createUserWithEmailAndPassword(
        email: mail, password: pwd);
    final User? user = userCredential.user;
    Map<String, dynamic> memberMap = {
      nameKey: name,
      surnameKey: surname,
      followingKey: [],
      followersKey: [user?.uid],
      imageUrlKey: "",
      uidKey: user?.uid
    };
    //Ajouter l'user
    addUserToFirebase(memberMap);
    return user;
  }

  logOut() {
    authInstance.signOut();
  }

  //Database
  static final firestoreInstance = FirebaseFirestore.instance;
  final fire_user = firestoreInstance.collection(memberRef);

  //Storage
  static final storageRef = storage.FirebaseStorage.instance.ref();

  addUserToFirebase(Map<String, dynamic> map) {
    fire_user.doc(map[uidKey]).set(map);
  }

  addPostToFirebase(String memberId, String text, File file) async {
    int date = DateTime.now().millisecondsSinceEpoch.toInt();
    List<dynamic> comments = [];
    List<dynamic> likes = [];
    Map<String, dynamic> map = {
      uidKey: memberId,
      commentKey: comments,
      likeKey: likes,
      dateKey: date,
    };
    if (text != null && text != "") {
      map[textKey] = text;
    }

    if (file != null) {
      final ref = storageRef.child("post").child(date.toString());
      storage.UploadTask task = ref.putFile(file);
      storage.TaskSnapshot snapshot = await task.whenComplete(() => null);
      String urlString = await snapshot.ref.getDownloadURL();
      map[imageUrlKey] = urlString;
      fire_user.doc(memberId).collection("post").doc().set(map);
    } else {
      fire_user.doc(memberId).collection("post").doc().set(map);
    }
  }

  Stream<QuerySnapshot>? postFrom(String uid) {
    return fire_user.doc(uid).collection("post").snapshots();
  }

  addOrRemoveLike(Post post, String memberId) {
    if (post.likes!.contains(memberId)) {
      post.ref?.update({
        likeKey: FieldValue.arrayRemove([memberId])
      });
    } else {
      post.ref?.update({
        likeKey: FieldValue.arrayUnion([memberId])
      });
    }
  }
}
