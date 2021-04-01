import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:myteam/modeller/usermodel.dart';

class Firebaseservis extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Usermodel _usermodel;
  get user => _usermodel;

  Firebaseservis() {
    currentuser();
    notifyListeners();
  }
  currentuser() {
    var kullanici = _auth.currentUser;
    _usermodel =_userfromfirebase(kullanici);
  }

  createwithemail(String email, String password) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _usermodel = _userfromfirebase(user.user);
      notifyListeners();
    } catch (e) {
      print("createmail hata");
    }
  }

  signwithemail(String email, String password) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      _usermodel = _userfromfirebase(user.user);
      notifyListeners();
    } catch (e) {
      print("signemail hata");
    }
  }

  signout() async {
    await _auth.signOut();
    _usermodel = null;
    notifyListeners();
  }

  _userfromfirebase(User user) {
    if (user == null) {
      return null;
    }
    return Usermodel(userID: user.uid);
  }
}
