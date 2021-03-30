import "package:flutter/material.dart";

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF4A5577),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 11 / 100,
              ),
              Text(
                "MyTeam",
                style: TextStyle(
                    fontFamily: "Sansita",
                    fontSize: 34,
                    color: Color(0xFFB957C1)),
              ),
              SizedBox(
                height: height * 7 / 100,
              ),
              Container(
                width: width * 80 / 100,
                height: height * 8 / 100,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Kullanıcı Adı",
                    hintStyle: TextStyle(color: Colors.red),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7),
              Container(
                width: width * 80 / 100,
                height: height * 8 / 100,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Kullanıcı Adı",
                    hintStyle: TextStyle(color: Colors.red),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7),
              Container(
                width: width * 80 / 100,
                height: height * 8 / 100,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Kullanıcı Adı",
                    hintStyle: TextStyle(color: Colors.red),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text("-Veya-", style: TextStyle(color: Colors.red)),
              SizedBox(
                height: 13,
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.red)),
                  width: width * 80 / 100,
                  height: height * 8 / 100,
                  child: Center(
                      child: Text(
                    "Google",
                    style: TextStyle(color: Colors.red),
                  )),
                ),
              ),
              SizedBox(
                height: 29,
              ),
              TextButton(
                  onPressed: () => null,
                  child: Text("Hesap Oluştur",
                      style: TextStyle(color: Colors.red))),
            ],
          ),
        ),
      ),
    );
  }
}