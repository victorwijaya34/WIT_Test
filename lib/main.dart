import 'package:flutter/material.dart';
import 'package:flutter_app/UI/List_Data.dart';
import 'package:flutter_app/launcher/launcher_view.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test",
      debugShowCheckedModeBanner: false,
      home: LauncherPage(),
    );
  }
}
