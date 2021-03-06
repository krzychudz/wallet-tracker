import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './screens/home/home_page.dart';
import 'routes/routes.dart' as Router;
import './theme/theme.dart' as Theme;

import './account/repository/account_repository.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => AccountRepository(),
      child: AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet tracker',
      theme: Theme.themeData(context),
      initialRoute: HomePage.routeName,
      routes: Router.routesMap,
    );
  }
}
