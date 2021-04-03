import "package:flutter/material.dart";
import 'package:myteam/servis/firebaseservis.dart';
import 'package:provider/provider.dart';

class Anasayfa extends StatefulWidget {
  Anasayfa({Key key}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    var kullanici = Provider.of<Firebaseservis>(context);
    return Center(
      child: Column(
        children: [
          Container(
             child: Text("ANasasyfaa"),
          ),
          ElevatedButton(
            onPressed: () async {
              await kullanici.signout();
            },
            child: Text("Çıkış Yap"),
          ),
        ],
      ),
    );
  }
}