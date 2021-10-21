import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:locategeouser/screens/getlocation/home_page.dart';
import 'package:locategeouser/screens/localpush/localpn.dart';
import 'package:locategeouser/screens/selection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SelectionScreen(),
    );
  }
}
