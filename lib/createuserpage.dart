import "package:flutter/material.dart";
import 'package:myteam/servis/firebaseservis.dart';
import 'package:provider/provider.dart';

class CreateUserPage extends StatefulWidget {
  CreateUserPage({Key key}) : super(key: key);

  @override
  _CreateUserPageState createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var kullanici = Provider.of<Firebaseservis>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width * 80 / 100,
                height: height * 8 / 100,
                child: TextField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    hintText: "E-mail giriniz",
                    hintStyle: TextStyle(color: Colors.red),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: width * 80 / 100,
                height: height * 8 / 100,
                child: TextField(
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                    hintText: "Şifre giriniz",
                    hintStyle: TextStyle(color: Colors.red),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.0),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                child: Text("Kayıt ol"),
                onPressed: () async {
                  await kullanici.createwithemail(
                      _emailcontroller.text, _passwordcontroller.text);
                  Navigator.pop(context);
                },
              ),
            ],
          )),
    );
  }
}
