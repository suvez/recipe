import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:recipe/model/yemek.dart';
import 'package:recipe/screens/YemeklerSayfa.dart';
import 'package:recipe/widgets/categorycardwidget.dart';

import '../widgets/yemekcardwidget.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({
    Key? key,
    required this.refKategoriler,
  }) : super(key: key);

  final DatabaseReference refKategoriler;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DatabaseEvent>(
      stream: refKategoriler.onValue,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var kategoriListesi = <Yemekler>[];

          var gelenDegerler =
              (snapshot.data?.snapshot.value as Map<dynamic, dynamic>)
                  .map<String, dynamic>(
                      (key, value) => MapEntry(key.toString(), value));

          if (gelenDegerler != null) {
            gelenDegerler.forEach((key, nesne) {
              var gelenKategori = Yemekler.fromJson(key, nesne);
              kategoriListesi.add(gelenKategori);
            });
          }

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 2 / 1,
            ),
            itemCount: kategoriListesi.length,
            itemBuilder: (context, index) {
              var yemek = kategoriListesi[index];
              return GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => DetaySayfa(
                  //       yemek: yemek,
                  //     ),
                  //   ),
                  // );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: YemekCardWidget(yemek: yemek),
                ),
              );
            },
          );
        } else {
          return Center();
        }
      },
    );
  }
}
