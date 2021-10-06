import 'package:flutter/material.dart';
import '../screens/home/home_page.dart';

Map<String, Widget Function(BuildContext)> routesMap = {
  HomePage.routeName: (context) => const HomePage(),
};
