import "package:flutter/material.dart";
import 'package:myteam/servis/firebaseservis.dart';
import 'package:myteam/tabsayfalari/anasayfa.dart';
import 'package:myteam/tabsayfalari/ilanekle.dart';
import 'package:myteam/tabsayfalari/kategori.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentindex = 0;
  List<Widget> widgetlar = [
    Anasayfa(),
    IlanEkle(),
    Kategori(),
  ];
  @override
  Widget build(BuildContext context) {
    var kullanici = Provider.of<Firebaseservis>(context);
    return Scaffold(    
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: CircleAvatar(
                backgroundImage: NetworkImage(kullanici.user.profilfoto),

              )),
              ListTile(
                title: Text("Profilim"),
              ),
              ListTile(
                title: Text("Bilgilerim"),
              ),
              ListTile(
                title: Text("Çıkış yap"),
                onTap: ()async{
                 await kullanici.signout();
                },
              ),
          ],
        ),
      ), 
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
        currentIndex: currentindex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "İlan Ekle"),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Kategoriler",
          ),
        ],
      ),
      body: widgetlar[currentindex],
    );
  }
}
