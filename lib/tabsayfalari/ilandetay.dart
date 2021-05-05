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
            Container(
              width: width,
              height: height * 23 / 100,
              child: Row(
                children: [
                  Container(
                    width: width / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 28, left: 28),
                          child: Text("Tarihxxx"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, top: 20),
                          child: Row(
                            children: [
                              CircleAvatar(
                                child: Text("R"),
                              ),
                              SizedBox(width: 7),
                              Text("Username"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 40),
                          child: Text(
                            "Proje Adı ",
                            style: TextStyle(fontSize: 26),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {}, child: Text("Başvuru yap")),
                        ElevatedButton(
                            onPressed: () {}, child: Text("Favorilere ekle")),
                        ElevatedButton(
                            onPressed: () {}, child: Text("Mesaj at")),
                        SizedBox(),
                        SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: width * 85 / 100,
              height: height * 25 / 100,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.red),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Aranan Yetenekler"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: width * 85 / 100,
              height: height * 25 / 100,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Proje Açıklaması"),
              ),
            ),
            Container(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 55, top: 44),
                    child: Text("Son 4 kişi"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
