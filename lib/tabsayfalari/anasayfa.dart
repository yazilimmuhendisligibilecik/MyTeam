import "package:flutter/material.dart";
import 'package:myteam/servis/firebaseservis.dart';
import 'package:myteam/tabsayfalari/components/ilanonizleme.dart';
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu),
          ),
          title: Text("My Team")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 2 / 100,
            ),
            Center(
              child: Container(
                width: width * 85 / 100,
                height: height * 7 / 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(18)),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      contentPadding: EdgeInsets.only(left: width * 36 / 100)),
                ),
              ),
            ),
            SizedBox(
              height: height * 5 / 100,
            ),
            Ilanonizleme(width: width),
            Ilanonizleme(width: width),
            Ilanonizleme(width: width),
            Ilanonizleme(width: width),
            Ilanonizleme(width: width),
            Ilanonizleme(width: width),
            Ilanonizleme(width: width),
            Ilanonizleme(width: width),
            Ilanonizleme(width: width),
          ],
        ),
      ),
    );
  }
}
