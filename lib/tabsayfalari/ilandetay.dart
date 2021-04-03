import "package:flutter/material.dart";

class IlanDetay extends StatefulWidget {
  IlanDetay({Key key}) : super(key: key);

  @override
  _IlanDetayState createState() => _IlanDetayState();
}

class _IlanDetayState extends State<IlanDetay> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text("İlan Detay")),
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text("22/06/2020"),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(),
                SizedBox(),
                SizedBox(),
                SizedBox(),
                SizedBox(),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Başvuru yap"),
                ),
              ],
            ),
            SizedBox(
              height: height * 3 / 100,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Text("İlan Başlığı"),
              SizedBox(
                width: width * 4 / 100,
              ),
              SizedBox(),
              ElevatedButton(
                onPressed: () {},
                child: Text("Favoriye ekle"),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Text("Aranan yetenekler"),
              SizedBox(
                width: width * 4 / 100,
              ),
              SizedBox(),
              ElevatedButton(
                onPressed: () {},
                child: Text("Mesaj gönder"),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
