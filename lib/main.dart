import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';
import 'screens/HomePage.dart';

void main() {
  Paint.enableDithering = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pushup Vault',
      theme: ThemeData(
        fontFamily: 'MyriadPro',
        primaryColor: primary_color,
        accentColor: secondary_color,
        backgroundColor: background_color,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
