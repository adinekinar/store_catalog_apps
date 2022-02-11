import 'package:flutter/material.dart';
import 'package:store_catalog_apps/authentication/loginPage.dart';
import 'package:store_catalog_apps/bottomnav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store Catalog Apps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInPage(),
    );
  }
}
