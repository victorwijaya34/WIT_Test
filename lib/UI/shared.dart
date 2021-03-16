import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/UI/ProductDetail.dart';
import 'package:flutter_app/UI/layout.dart';

// Untuk Button di Grid View
class ReusableContainer extends StatelessWidget {
  ReusableContainer({@required  this.cover, this.name, this.price});

  final String cover;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return ProductDetail();
        }));
      },
      child: Container(
        width: double.infinity,
        height: SizeConfig.blockHorizontal * 60,
        margin: EdgeInsets.only(top: SizeConfig.blockHorizontal * 10, left: SizeConfig.blockHorizontal * 5, right: SizeConfig.blockHorizontal * 5),
        padding: EdgeInsets.all(SizeConfig.blockHorizontal * 3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(SizeConfig.blockHorizontal * 5),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: SizeConfig.blockVertical * 0.5)]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Image.network(cover),
            SizedBox(height: SizeConfig.blockVertical * 2),
            TeksDua(label: name, ukuran: 4,),
            TeksSatu(label: price, ukuran: 4),
          ],
        ),
      ),
    );
  }
}

// Untuk Button di Menu Navigation
class ReusableButton extends StatelessWidget {
  ReusableButton({@required  this.warna, this.ikon, this.label});

  final Color warna;
  final IconData ikon;
  final String label;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.blockHorizontal * 40,
      height: SizeConfig.blockHorizontal * 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: SizeConfig.blockHorizontal * 22,
            height: SizeConfig.blockHorizontal * 22,
            decoration: BoxDecoration(
              color: warna,
              borderRadius: BorderRadius.circular(100)
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Icon(ikon, color: Colors.white,),
            ),
          ),
          SizedBox(height: SizeConfig.blockVertical * 2,),
          TeksTiga(label: label, ukuran: 3),
        ],
      ),
    );
  }
}

class TeksSatu extends StatelessWidget {
  TeksSatu({@required  this.label, this.ukuran});

  final String label;
  final int ukuran;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Text(
      label,
      style: TextStyle(fontSize: SizeConfig.blockVertical * ukuran, fontWeight: FontWeight.bold),
    );
  }
}

class TeksDua extends StatelessWidget {
  TeksDua({@required  this.label, this.ukuran});

  final String label;
  final int ukuran;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Text(
      label,
      style: TextStyle(fontSize: SizeConfig.blockVertical * ukuran),
    );
  }
}

class TeksTiga extends StatelessWidget {
  TeksTiga({@required  this.label, this.ukuran});

  final String label;
  final int ukuran;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Text(
      label,
      style: TextStyle(fontSize: SizeConfig.blockVertical * ukuran, color: Colors.grey),
    );
  }
}