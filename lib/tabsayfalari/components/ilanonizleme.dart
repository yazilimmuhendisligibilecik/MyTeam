import "package:flutter/material.dart";
import 'package:myteam/tabsayfalari/ilandetay.dart';

class Ilanonizleme extends StatelessWidget {
  const Ilanonizleme({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>IlanDetay()));
      },
      child: Container(
        width: width * 80 / 100,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Center(child: Text("Proje Adı")),
              ListTile(
                leading: CircleAvatar(child: Text("AA")),
                title: Text("Yetenekler"),
              ),
              ListTile(
                trailing: Text("Son 4 kişi "),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
