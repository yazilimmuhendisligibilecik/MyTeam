/*import "package:flutter/material.dart";
import 'package:myteam/modeller/ilanlar.dart';
import 'package:myteam/servis/firebaseservis.dart';
import 'package:myteam/tabsayfalari/ilandetay.dart';
import 'package:provider/provider.dart';

class Ilanonizleme extends StatelessWidget {
  const Ilanonizleme({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;


  @override
  Widget build(BuildContext context) {
    var kullanici = Provider.of<Firebaseservis>(context);
    return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => IlanDetay()));
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
                                      Center(child: Text("Proje Adı")),
                                      
                                      ListTile(
                                        trailing: Text("Son 4 kişi "),
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
  }
}
*/