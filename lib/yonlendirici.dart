import "package:flutter/material.dart";
import 'package:myteam/homepage.dart';
import 'package:myteam/servis/firebaseservis.dart';
import 'package:myteam/signinpage.dart';
import 'package:provider/provider.dart';

class Yonlendirici extends StatelessWidget {
  const Yonlendirici({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var kullanici = Provider.of<Firebaseservis>(context);
    return kullanici.user == null ? SignInPage() : HomePage();
  }
}
