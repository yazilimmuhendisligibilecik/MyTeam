import 'package:cloud_firestore/cloud_firestore.dart';

class Ilanlar {
  String profilurl;
  final String ilanadi; 
  final String aciklama; 
  final String yetenekler; 
  final String userID;
  final String kisisayi;
  final DateTime tarih;

  //boostmu ?

  Ilanlar({
    this.kisisayi,
    this.tarih,
    this.userID,
    this.profilurl,
    this.ilanadi,
    this.aciklama,
    this.yetenekler,
  });

  Map<String, dynamic> toMap() {
    return {
      "userID": userID,
      "profilurl": profilurl,
      "ilanadi": ilanadi,
      "aciklama": aciklama,
      "yetenekler": yetenekler,
      "kisisayi": kisisayi,
      "tarih": tarih ?? FieldValue.serverTimestamp(),
    };
  }

  Ilanlar.toObj(Map<String, dynamic> obje)
      : userID = obje["userID"],
        profilurl = obje["profilurl"],
        ilanadi = obje["ilanadi"],
        aciklama = obje["aciklama"],
        yetenekler = obje["yetenekler"],
        kisisayi = obje["kisisayi"],
        tarih = (obje["tarih"] as Timestamp).toDate();
}
