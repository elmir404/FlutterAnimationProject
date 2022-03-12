import 'package:flutter/material.dart';

import 'menu_dashboard_widget.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuDashboard(),
    );
  }
}
