import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myteam/modeller/ilanlar.dart';
import 'package:myteam/modeller/usermodel.dart';

class Firebaseservis extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _store = FirebaseFirestore.instance;
  Usermodel _usermodel;
  Usermodel get user => _usermodel;
  List veriler;

  Firebaseservis() {
    currentuser();
    notifyListeners();
  }

  _userfromfirebase(User user) {
    if (user == null) {
      return null;
    }
    return Usermodel(userID: user.uid, email: user.email);
  }

  currentuser() async {
    var kullanici = _auth.currentUser;
    _usermodel = _userfromfirebase(kullanici);
    if (_usermodel != null) {
      DocumentSnapshot kimlik =
          await _store.collection("users").doc(_usermodel.userID).get();
      Map gelendata = kimlik.data();
      _usermodel = Usermodel.toObj(gelendata);
    }
    notifyListeners();
  }

  Future<Usermodel> createwithemail(String email, String password) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      _usermodel = _userfromfirebase(user.user);
      await verilerikaydet(_usermodel);
      _usermodel = await verilerioku(_usermodel);
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
      _usermodel = await verilerioku(_usermodel);
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
          QuerySnapshot sonuc = await _store
              .collection("users")
              .where("email", isEqualTo: _usermodel.email)
              .get();
          if (sonuc.docs.length < 1) {
            await verilerikaydet(_usermodel);
          }
          _usermodel = await verilerioku(_usermodel);

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
  // ___________________________--------------------__________________

  Future verilerikaydet(Usermodel usermodel) async {
    await _store
        .collection("users")
        .doc(usermodel.userID)
        .set(usermodel.toMap());
  }

  Future verilerioku(Usermodel myusermodel) async {
    DocumentSnapshot kimlik =
        await _store.collection("users").doc(myusermodel.userID).get();
    Map gelendata = kimlik.data();
    var veriler = Usermodel.toObj(gelendata);
    print(veriler.toString());
    return veriler;
  }

  Future ilanekle(Ilanlar ilan) async {
    var id = _store.collection("ilanlar").doc().id;
    _store.collection("ilanlar").doc(id).set(ilan.toMap());
  }

  Stream<List<Ilanlar>> ilanlarigetir() {
    //Anasayfa için
    Stream<QuerySnapshot> ilanlar = _store.collection("ilanlar").snapshots();

    var yeniilan = ilanlar.map((ilanliste) =>
        ilanliste.docs.map((e) => Ilanlar.toObj(e.data())).toList());
    
    return yeniilan;
  }


  Stream kategorigetir(String kategori) {
    var gelenkategori = _store
        .collection("ilanlar")
        .where("yetenekler", isEqualTo: kategori)
        .snapshots();

    var yeniilan = gelenkategori.map((ilanliste) =>
        ilanliste.docs.map((e) => Ilanlar.toObj(e.data())).toList());
    return yeniilan;
  }
}
