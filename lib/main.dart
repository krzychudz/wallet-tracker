import 'package:flutter/material.dart';
import './screens/home/home_page.dart';
import 'routes/routes.dart' as Router;
import './theme/theme.dart' as Theme;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet tracker',
      theme: Theme.themeData(context),
      initialRoute: HomePage.routeName,
      routes: Router.routesMap,
    );
  }
}
