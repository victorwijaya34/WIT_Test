import 'dart:convert';

import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/UI/layout.dart';
import 'package:flutter_app/UI/shared.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    BorderRadiusGeometry radius = BorderRadius.circular(25.0);
    List<IconData> icons = [Icons.ac_unit, Icons.account_balance, Icons.adb, Icons.add_photo_alternate, Icons.format_line_spacing, Icons.six_ft_apart, Icons.download_done_sharp,
    Icons.filter_drama_rounded, Icons.account_circle, Icons.kitchen_sharp, Icons.nature, Icons.mail, Icons.weekend_outlined];

    SizeConfig().init(context);
    return Scaffold(
        body: DraggableBottomSheet(
          backgroundWidget: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(centerTitle: true, title: Text('List Product'), backgroundColor: Colors.red,),
            body: _buildWidgetListDataAndroid(),
          ),

          previewChild: Container(
            height: SizeConfig.blockVertical * 10,
            width: SizeConfig.blockHorizontal * 150,
            margin: EdgeInsets.symmetric(vertical: SizeConfig.blockVertical * 5, horizontal: SizeConfig.blockHorizontal * 15),
            padding: EdgeInsets.all(SizeConfig.blockVertical * 2),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Container(
                  width: SizeConfig.blockHorizontal * 20,
                  height: SizeConfig.blockVertical * 2,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
                SizedBox(height: SizeConfig.blockVertical * 2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ReusableButton(warna: Colors.red, ikon: Icons.live_tv, label: 'Live Show',),
                    ReusableButton(warna: Colors.red, ikon: Icons.stream, label: 'Stream',),
                    ReusableButton(warna: Colors.red, ikon: Icons.book, label: 'Course',),
                    ReusableButton(warna: Colors.red, ikon: Icons.add_comment, label: 'Comment',),
                  ],
                ),

              ],
            ),
          ),

          expandedChild: Container(
            padding: EdgeInsets.symmetric(vertical: SizeConfig.blockVertical * 3, horizontal: SizeConfig.blockHorizontal * 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: SizeConfig.blockVertical * 1,),
                Icon(Icons.keyboard_arrow_down, size: SizeConfig.blockVertical * 10, color: Colors.grey,),
                SizedBox(height: SizeConfig.blockVertical * 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TeksSatu(label: 'Features', ukuran: 7,),
                  ],
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 4,
                    children: <Widget> [
                      ReusableButton(warna: Colors.red, ikon: Icons.ac_unit, label: 'Satu',),
                      ReusableButton(warna: Colors.red, ikon: Icons.ac_unit, label: 'Satu',),
                      ReusableButton(warna: Colors.red, ikon: Icons.ac_unit, label: 'Satu',),
                      ReusableButton(warna: Colors.red, ikon: Icons.ac_unit, label: 'Satu',),
                      ReusableButton(warna: Colors.green, ikon: Icons.ac_unit, label: 'Satu',),
                      ReusableButton(warna: Colors.green, ikon: Icons.ac_unit, label: 'Satu',),
                      ReusableButton(warna: Colors.green, ikon: Icons.ac_unit, label: 'Satu',),
                      ReusableButton(warna: Colors.green, ikon: Icons.ac_unit, label: 'Satu',),
                      ReusableButton(warna: Colors.blue, ikon: Icons.ac_unit, label: 'Satu',),
                      ReusableButton(warna: Colors.black12, ikon: Icons.ac_unit, label: 'Satu',),
                      ReusableButton(warna: Colors.grey, ikon: Icons.ac_unit, label: 'Satu',),
                      ReusableButton(warna: Colors.yellow, ikon: Icons.ac_unit, label: 'Satu',),
                    ],
                  ),
                )
              ],
            ),
          ),

          minExtent: SizeConfig.blockVertical * 36,
          maxExtent: SizeConfig.blockVertical * 180,
        )
    );
  }

  Widget _buildWidgetListDataAndroid() {
    return RefreshIndicator(
      onRefresh: refreshData,
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
        ],
      ) : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future refreshData() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
  }
}


