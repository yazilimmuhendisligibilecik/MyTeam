import "package:flutter/material.dart";

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
<<<<<<< Updated upstream
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300,
          floating: false,
          pinned: true,
          backgroundColor: Colors.orange,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Kategoriler"),
            centerTitle: true,
            background: Container(
              width: width,
              height: 250,
              color: Colors.red,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(top: 14.0),
          sliver: SliverGrid.count(
              crossAxisSpacing: 20,
              mainAxisSpacing: 30,
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
                Griditem(
                  itemcolor: Colors.indigo,
                  itemname: "C",
                ),
                Griditem(
                  itemcolor: Colors.amber,
                  itemname: "C++",
                ),
                Griditem(
                  itemcolor: Colors.purple,
                  itemname: "Go",
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
  const Griditem({
    Key key,
    @required this.itemname,
    @required this.itemcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: Container(
          color: itemcolor,
          child: Center(
              child: Text(
            itemname,
            style: TextStyle(fontSize: 22),
          ))),
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
=======
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
>>>>>>> Stashed changes
