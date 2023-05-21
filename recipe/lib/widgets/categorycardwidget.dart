import 'package:flutter/material.dart';
import 'package:recipe/model/yemek.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({
    Key? key,
    required this.kategori,
  }) : super(key: key);

  Yemekler? kategori;

  @override
  Widget build(BuildContext context) {
    return Card(
      //
      // color: Colors.blueGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Image.network(
              // "https://cdn.ntvspor.net/5a28979268064f76a8cef3c21f0d3860.jpg?&mode=crop&w=940&h=626.6666666666666",
              "https://www.bestepebloggers.com/wp-content/uploads/2021/04/healthy-lifestyle-1024x576-1.jpg",
              height: 130.0,
              width: 200.0,
            ),
          ),
          Text(
            kategori?.Yemek_adi ?? 'Yemekler',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
