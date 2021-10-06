import 'package:flutter/material.dart';
import 'package:wallet_tracker/screens/home/home_page.dart';
import 'routes/routes.dart' as Router;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routeName,
      routes: Router.routesMap,
    );
  }
}
