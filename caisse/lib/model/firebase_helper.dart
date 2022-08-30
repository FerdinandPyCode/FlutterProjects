
import 'package:caisse/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHandler{
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
    Map<String, dynamic> userMap = {
      nameKey: name,
      surnameKey: surname,
      
      imageUrlKey: "",
      uidKey: user?.uid
    };
    //Ajouter l'user
    addUserToFirebase(userMap);
    return user;
  }

  logOut() {
    authInstance.signOut();
  }

    //Database
  static final firestoreInstance = FirebaseFirestore.instance;
  final fire_user = firestoreInstance.collection(userRef);

  addUserToFirebase(Map<String, dynamic> map) {
    fire_user.doc(map[uidKey]).set(map);
  }

}