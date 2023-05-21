import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:recipe/model/yemek.dart';

import '../widgets/yemekcardwidget.dart';

class YemeklerSayfa extends StatefulWidget {
  final DatabaseReference refKategoriler;

  YemeklerSayfa({super.key, required this.refKategoriler});

  @override
  _YemeklerSayfaState createState() => _YemeklerSayfaState();
}

class _YemeklerSayfaState extends State<YemeklerSayfa> {
  bool searchState = false;
  String searchWord = "";

  @override
  Widget build(BuildContext context) {
    DatabaseReference refKategoriler = widget.refKategoriler;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: searchState
            ? TextField(
                decoration: InputDecoration(
                  hintText: "Search Something..",
                  hintStyle: TextStyle(color: Colors.white),
                ),
                onChanged: (resultSearch) {
                  print("Sonuc : $resultSearch");
                  setState(() {
                    searchWord = resultSearch;
                  });
                },
              )
            : Text("Yemekler"),
        actions: [
          searchState
              ? IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      searchState = false;
                      searchWord = "";
                    });
                  })
              : IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      searchState = true;
                    });
                  }),
        ],
      ),
      body: StreamBuilder<DatabaseEvent>(
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
      ),
    );
  }
}
