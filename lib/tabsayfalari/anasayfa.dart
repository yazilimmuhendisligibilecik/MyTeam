import "package:flutter/material.dart";
import 'package:myteam/modeller/ilanlar.dart';
import 'package:myteam/servis/firebaseservis.dart';
import 'package:myteam/tabsayfalari/components/ilanonizleme.dart';
import 'package:myteam/tabsayfalari/ilandetay.dart';
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
      body: Column(
        children: [
          SizedBox(
            height: height * 2 / 100,
          ),
          Center(
            child: Container(
              width: width * 85 / 100,
              height: height * 7 / 100,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(18)),
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
          Flexible(
            child: StreamBuilder<List<Ilanlar>>(
                stream: kullanici.ilanlarigetir(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data.length < 1) {
                    return Center(
                        child: Text("Herhangi bir ilan bulunmamaktadır."));
                  }
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        var veri = snapshot.data[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => IlanDetay(
                                        aciklama: veri.aciklama,
                                        deneyim: veri.yetenekler,
                                        ilanadi: veri.ilanadi,
                                        kisisayi: veri.kisisayi,
                                        profilurl: veri.profilurl,
                                        tarih: veri.tarih)));
                          },
                          child: Column(
                            children: [
                              Container(
                                width: width * 80 / 100,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      Center(
                                          child: Text(veri
                                              .ilanadi
                                              .toUpperCase())),
                                      ListTile(
                                        leading: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              veri.profilurl),
                                        ),
                                        trailing: Text("Son " +
                                            veri.kisisayi +
                                            " kişi"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}
