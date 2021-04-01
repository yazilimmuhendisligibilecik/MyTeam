import "package:flutter/material.dart";
import 'package:myteam/servis/firebaseservis.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var kullanici = Provider.of<Firebaseservis>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              await kullanici.signout();
            },
            child: Text("Çıkış Yap"),
          ),
          Center(child: Text("HomePage")),
        ],
      ),
    );
  }
}
