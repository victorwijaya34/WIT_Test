import 'package:flutter/material.dart';
import 'package:flutter_app/UI/layout.dart';
import 'package:flutter_app/UI/shared.dart';

class ProductDetail extends StatefulWidget {

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

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
            Image.network('https://www.masakapahariini.com/wp-content/uploads/2018/10/burger-rendang-MAHI-6.jpg'),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(SizeConfig.blockHorizontal * 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TeksDua(label: 'nama', ukuran: 5,),
                  TeksSatu(label: '40000', ukuran: 6,),
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