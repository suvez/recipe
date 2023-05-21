import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recipe/model/yemek.dart';
import 'package:recipe/screens/CategoriesPage.dart';
import 'package:recipe/screens/YemeklerSayfa.dart';
import 'package:recipe/screens/categories_full.dart';
import 'package:recipe/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Anasayfa());
}

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var refKategoriler = FirebaseDatabase.instance.ref().child("Yemekler");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: YemeklerSayfa(refKategoriler: refKategoriler),
    );
  }
}

/* Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Kategoriler")),
      ),
      body: CategoriesPage(refKategoriler: refKategoriler),
    );*/
