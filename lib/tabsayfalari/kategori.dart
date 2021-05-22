import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:myteam/tabsayfalari/kategoridetay.dart';

class Kategori extends StatefulWidget {
  Kategori({Key key}) : super(key: key);

  @override
  _KategoriState createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
              title: Text("Kategoriler"),
              centerTitle: true,
              background: Image.network(
                "https://miro.medium.com/max/700/1*HLGtY6O2vUHqIyEbWdmBgA.jpeg",
                fit: BoxFit.fill,
              )),
        ),
        SliverPadding(
          padding: EdgeInsets.only(top: 14.0),
          sliver: SliverGrid.count(
              crossAxisSpacing: 20,
              mainAxisSpacing: 30,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KategoriDetay(
                                  kategori: "Flutter",
                                )));
                  },
                  child: Griditem(
                    dosyayolu: "lib/assets/flutter.png",
                    itemcolor: Colors.blue,
                    itemname: "Flutter",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KategoriDetay(
                                  kategori: "Java",
                                )));
                  },
                  child: Griditem(
                    dosyayolu: "lib/assets/java.png",
                    itemcolor: Colors.blue,
                    itemname: "Java",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KategoriDetay(
                                  kategori: "C#",
                                )));
                  },
                  child: Griditem(
                    dosyayolu: "lib/assets/c#.png",
                    itemcolor: Colors.blue,
                    itemname: "C#",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KategoriDetay(
                                  kategori: "Python",
                                )));
                  },
                  child: Griditem(
                    dosyayolu: "lib/assets/python.png",
                    itemcolor: Colors.blue,
                    itemname: "Python",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KategoriDetay(
                                  kategori: "Php",
                                )));
                  },
                  child: Griditem(
                    dosyayolu: "lib/assets/php.png",
                    itemcolor: Colors.blue,
                    itemname: "Php",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KategoriDetay(
                                  kategori: "Visual Basic",
                                )));
                  },
                  child: Griditem(
                    dosyayolu: "lib/assets/visualbasic.png",
                    itemcolor: Colors.blue,
                    itemname: "Visual Basic",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KategoriDetay(
                                  kategori: "C",
                                )));
                  },
                  child: Griditem(
                    dosyayolu: "lib/assets/c.png",
                    itemcolor: Colors.blue,
                    itemname: "C",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KategoriDetay(
                                  kategori: "C++",
                                )));
                  },
                  child: Griditem(
                    dosyayolu: "lib/assets/c++.png",
                    itemcolor: Colors.blue,
                    itemname: "C++",
                  ),
                ),
              ],
              crossAxisCount: 2),
        ),
      ],
    );
  }
}

class Griditem extends StatelessWidget {
  final String itemname;
  final Color itemcolor;
  final String dosyayolu;
  const Griditem({
    Key key,
    @required this.itemname,
    @required this.itemcolor,
    this.dosyayolu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: Container(
          color: itemcolor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  itemname,
                  style: TextStyle(fontSize: 22),
                ),
                Image.asset(dosyayolu),
              ],
            ),
          )),
    );
  }
}

/*
Column(
      children: [
        Container(
          color: Colors.green,
          width: width,
          height: height * 40 / 100,
          child: Center(child: Text("ÜST KISIM")),
        ),
        Flexible(
          child: GridView.count(
            crossAxisSpacing: width * 10 / 100,
            mainAxisSpacing: height * 4 / 100,
            physics: ScrollPhysics(),
            crossAxisCount: 2,
            children: [
              Griditem(
                itemcolor: Colors.blue,
                itemname: "Flutter",
              ),
              Griditem(
                itemcolor: Colors.orange,
                itemname: "Java",
              ),
              Griditem(
                itemcolor: Colors.blueGrey[400],
                itemname: "C#",
              ),
              Griditem(
                itemcolor: Colors.yellow,
                itemname: "Python",
              ),
              Griditem(
                itemcolor: Colors.red,
                itemname: "PHP",
              ),
              Griditem(
                itemcolor: Colors.brown,
                itemname: "Visual Basic",
              ),
            ],
          ),
        ),
      ],
    ); */
/*
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.green,
            width: width,
            height: height * 40 / 100,
            child: Center(child: Text("ÜST KISIM")),
          ),
          Container(
            width: width,
            height: 500,
            child: GridView.builder(
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: width * 21 / 100,
                  mainAxisSpacing: height * 15 / 100,
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    color: Colors.red,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
*/
