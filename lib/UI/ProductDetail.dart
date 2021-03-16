import 'package:flutter/material.dart';
import 'package:flutter_app/UI/layout.dart';
import 'package:flutter_app/UI/shared.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({@required this.gambar, this.nama, this.harga});

  String gambar;
  String nama;
  String harga;

  @override

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Product Detail'),
        backgroundColor: Colors.red,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: SizeConfig.blockVertical * 45,
              child: Image.network(gambar, fit: BoxFit.fill,),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(SizeConfig.blockHorizontal * 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TeksDua(label: nama, ukuran: 5,),
                  TeksSatu(label: harga, ukuran: 6,),
                ],
              ),
            ),
            Divider(),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(SizeConfig.blockHorizontal * 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TeksSatu(label: 'Description', ukuran: 7,),
                  TeksTiga(label: 'Penjelasan\nPenjelasan\nPenjelasan\nPenjelasan\nPenjelasan\nPenjelasan\nPenjelasan\n', ukuran: 5,),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}