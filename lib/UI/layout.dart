import 'package:flutter/widgets.dart';
//Untuk Pengaturan Ukuran Layout
class SizeConfig{
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockHorizontal;
  static double blockVertical;

  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockHorizontal = screenWidth / 200;
    blockVertical = screenHeight / 200;
  }
}
