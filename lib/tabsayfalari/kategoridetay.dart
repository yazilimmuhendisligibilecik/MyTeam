import "package:flutter/material.dart";
import 'package:myteam/modeller/ilanlar.dart';
import 'package:myteam/servis/firebaseservis.dart';
import 'package:myteam/tabsayfalari/ilandetay.dart';
import 'package:provider/provider.dart';

class KategoriDetay extends StatefulWidget {
  String kategori;
  KategoriDetay({Key key, this.kategori}) : super(key: key);

  @override
  _KategoriDetayState createState() => _KategoriDetayState();
}

class _KategoriDetayState extends State<KategoriDetay> {
  @override
  Widget build(BuildContext context) {
    var kullanici = Provider.of<Firebaseservis>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title:Text(widget.kategori)
      ),
      body: StreamBuilder<List<Ilanlar>>(
          stream: kullanici.kategorigetir(widget.kategori),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data.length < 1) {
              return Center(child: Text("Herhangi bir ilan bulunmamaktadır."));
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
                                Center(child: Text(veri.ilanadi.toUpperCase())),
                                ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(veri.profilurl),
                                  ),
                                  trailing:
                                      Text("Son " + veri.kisisayi + " kişi"),
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
    );
  }
}
