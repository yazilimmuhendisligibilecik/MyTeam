import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myteam/modeller/usermodel.dart';

class Firebaseservis extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _store = FirebaseFirestore.instance;
  Usermodel _usermodel;
  get user => _usermodel;

  Firebaseservis() {
    currentuser();
    notifyListeners();
  }

  _userfromfirebase(User user) {
    if (user == null) {
      return null;
    }
    return Usermodel(userID: user.uid);
  }

  currentuser() {
    var kullanici = _auth.currentUser;
    _usermodel = _userfromfirebase(kullanici);
  }

  Future<Usermodel> createwithemail(String email, String password) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      _usermodel = _userfromfirebase(user.user);
      notifyListeners();
      return _usermodel;
    } catch (e) {
      print("createmail hata");
      return null;
    }
  }

  Future<Usermodel> signwithemail(String email, String password) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      _usermodel = _userfromfirebase(user.user);
      notifyListeners();
      return _usermodel;
    } catch (e) {
      print("signemail hata");
      return null;
    }
  }

  Future<Usermodel> signwithgoogle() async {
    try {
      GoogleSignIn _googlesignin = GoogleSignIn();
      GoogleSignInAccount _googleuser = await _googlesignin.signIn();
      if (_googleuser != null) {
        GoogleSignInAuthentication _googleauth =
            await _googleuser.authentication;
        if (_googleauth.idToken != null && _googleauth.accessToken != null) {
          UserCredential userx = await _auth.signInWithCredential(
              GoogleAuthProvider.credential(
                  accessToken: _googleauth.accessToken,
                  idToken: _googleauth.idToken));
          User _userg = userx.user;
          _usermodel = _userfromfirebase(_userg);
          /* QuerySnapshot sonuc = await _dbservis
              .collection("users")
              .where("email", isEqualTo: _usermodel.email)
              .get(); */
          /* if (sonuc.docs.length < 1) {
            await verilerikaydet(_usermodel);
          }*/
          // _usermodel = await verilerioku(_usermodel);
          //
          notifyListeners();
          return _usermodel;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("Hata google var" + e.toString());
      return null;
    }
  }

  signout() async {
    await _auth.signOut();
    _usermodel = null;
    notifyListeners();
  }

 
}
