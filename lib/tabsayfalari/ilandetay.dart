import "package:flutter/material.dart";
import 'package:myteam/servis/firebaseservis.dart';
import 'package:provider/provider.dart';

class IlanDetay extends StatefulWidget {
  String aciklama;
  String deneyim;
  String ilanadi;
  String kisisayi;
  String profilurl;
  DateTime tarih;
  IlanDetay(
      {Key key,
      this.aciklama,
      this.deneyim,
      this.ilanadi,
      this.kisisayi,
      this.profilurl,
      this.tarih})
      : super(key: key);

  @override
  _IlanDetayState createState() => _IlanDetayState();
}

class _IlanDetayState extends State<IlanDetay> {
  @override
  Widget build(BuildContext context) {
    var kullanici = Provider.of<Firebaseservis>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text("İlan Detay")),
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            Container(
              width: width,
              height: height * 23 / 100,
              child: Row(
                children: [
                  Container(
                    width: width / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 28, left: 28),
                          child: Column(
                            children: [
                              Text(widget.tarih.day.toString() +
                                  "/" +
                                  widget.tarih.month.toString() +
                                  "/" +
                                  widget.tarih.year.toString()),
                              Text(widget.tarih.hour.toString() +
                                  ":" +
                                  widget.tarih.minute.toString()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, top: 20),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(widget.profilurl),
                              ),
                              SizedBox(width: 7),
                              Text("email"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 40),
                          child: Text(
                            widget.ilanadi,
                            style: TextStyle(fontSize: 26),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {}, child: Text("Başvuru yap")),
                        ElevatedButton(
                            onPressed: () {}, child: Text("Favorilere ekle")),
                        ElevatedButton(
                            onPressed: () {}, child: Text("Mesaj at")),
                        SizedBox(),
                        SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: width * 85 / 100,
              height: height * 25 / 100,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.red),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.deneyim),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: width * 85 / 100,
              height: height * 25 / 100,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.aciklama),
              ),
            ),
            Container(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 55, top: 44),
                    child: Text("Son " + widget.kisisayi + " kişi"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
