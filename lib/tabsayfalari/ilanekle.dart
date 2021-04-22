import "package:flutter/material.dart";
import 'package:myteam/modeller/ilanlar.dart';
import 'package:myteam/servis/firebaseservis.dart';
import 'package:provider/provider.dart';

class IlanEkle extends StatefulWidget {
  IlanEkle({Key key}) : super(key: key);

  @override
  _IlanEkleState createState() => _IlanEkleState();
}

class _IlanEkleState extends State<IlanEkle> {
  TextEditingController _projeadcontroller = TextEditingController();
  TextEditingController _yetenekcontroller = TextEditingController();
  TextEditingController _aciklamacontroller = TextEditingController();
  TextEditingController _kisisayicontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var kullanici = Provider.of<Firebaseservis>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            SizedBox(
              height: height * 13 / 100,
            ),
            Container(
              width: width * 75 / 100,
              height: height * 8 / 100,
              child: TextFormField(
                controller: _projeadcontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                    ),
                    hintText: "Proje Adı Giriniz."),
              ),
            ),
            SizedBox(height: height * 4 / 100),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(20),
              ),
              width: width * 75 / 100,
              height: height * 21 / 100,
              child: TextFormField(
                controller: _yetenekcontroller,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "İstenen Yetenekleri Giriniz."),
              ),
            ),
            SizedBox(height: height * 6 / 100),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(20),
              ),
              width: width * 75 / 100,
              height: height * 21 / 100,
              child: TextFormField(
                controller: _aciklamacontroller,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Proje Açıklaması Giriniz."),
              ),
            ),
            SizedBox(
              height: height * 3 / 100,
            ),
            Container(
              width: width * 75 / 100,
              height: height * 8 / 100,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _kisisayicontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                    ),
                    hintText: "Kaç kişilik ekip olacak ?"),
              ),
            ),
            SizedBox(
              height: height * 3 / 100,
            ),
            ElevatedButton(
              child: Text("İlanı Ekle"),
              onPressed: () async {
                Ilanlar ilan = Ilanlar(
                  userID: kullanici.user.userID,
                  aciklama: _aciklamacontroller.text,
                  ilanadi: _projeadcontroller.text,
                  kisisayi: _kisisayicontroller.text,
                  yetenekler: _yetenekcontroller.text,
                  profilurl: kullanici.user.profilfoto,
                );
                await kullanici.ilanekle(ilan);

                _aciklamacontroller.clear();
                _projeadcontroller.clear();
                _kisisayicontroller.clear();
                _yetenekcontroller.clear();
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text("İlan Eklendi"),
                      );
                    });
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
