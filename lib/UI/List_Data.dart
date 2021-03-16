import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/UI/layout.dart';
import 'package:flutter_app/UI/shared.dart';
import 'package:http/http.dart' as http;

class ListData extends StatefulWidget {

  @override
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  var datas = [];
  bool _isLoading = false;
  void _getData() async {
    var res = await http.get('https://api.mocki.io/v1/1f8a681f');
    var body = json.decode(res.body);
    setState(() {
      datas=body['product'];
      _isLoading = true;
    });

  }

  @override
  initState() {
    super.initState();
    // baca Shared Preferences
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('List Product'),
        backgroundColor: Colors.red,
      ),

      body: SizedBox.expand(
        child: _isLoading ? Stack(
          children: <Widget>[
            GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
                ReusableContainer(cover: datas[0]['cover'], name: datas[0]['name'] , price: datas[0]['price'].toString()),
                ReusableContainer(cover: datas[1]['cover'], name: datas[1]['name'], price: datas[1]['price'].toString()),
                ReusableContainer(cover: datas[2]['cover'], name: datas[2]['name'], price: datas[2]['price'].toString()),
                ReusableContainer(cover: datas[3]['cover'], name: datas[3]['name'], price: datas[3]['price'].toString()),
              ],
            ),
            Container(
              child: DraggableScrollableSheet(
                initialChildSize: 0.15,
                minChildSize: 0.15,
                maxChildSize: 0.9,
                builder: (BuildContext c, s) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockHorizontal * 10, vertical: SizeConfig.blockVertical * 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(SizeConfig.blockHorizontal * 20), topRight: Radius.circular(SizeConfig.blockHorizontal * 20) ),
                      boxShadow: [BoxShadow(color: Colors.grey, blurRadius: SizeConfig.blockVertical * 2)]
                    ),
                    child: ListView(
                      controller: s,
                      children: <Widget>[

                        TeksSatu(label: 'Features', ukuran: 7,),
                        SizedBox(height: SizeConfig.blockVertical * 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ReusableButton(warna: Colors.red, ikon: Icons.live_tv, label: 'Live Show',),
                            ReusableButton(warna: Colors.red, ikon: Icons.stream, label: 'Stream',),
                            ReusableButton(warna: Colors.red, ikon: Icons.book, label: 'Course',),
                            ReusableButton(warna: Colors.red, ikon: Icons.add_comment, label: 'Comment',),
                          ],
                        ),
                        SizedBox(height: SizeConfig.blockVertical * 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ReusableButton(warna: Colors.blue, ikon: Icons.account_circle, label: 'Profile',),
                            ReusableButton(warna: Colors.blue, ikon: Icons.save_outlined, label: 'Saved',),
                            ReusableButton(warna: Colors.blue, ikon: Icons.play_circle_fill, label: 'Recent',),
                            ReusableButton(warna: Colors.blue, ikon: Icons.list_alt, label: 'Wishlist',),
                          ],
                        ),
                        SizedBox(height: SizeConfig.blockVertical * 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ReusableButton(warna: Colors.green, ikon: Icons.shopping_cart_outlined, label: 'Chart',),
                            ReusableButton(warna: Colors.green, ikon: Icons.history, label: 'History',),
                            ReusableButton(warna: Colors.grey, ikon: Icons.extension, label: 'Coming Soon',)
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ) : Center(
          child: CircularProgressIndicator(),
        ),
      ),
    ));
  }

}

