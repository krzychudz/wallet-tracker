import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './screens/home/home_page.dart';
import 'routes/routes.dart' as Router;
import './theme/theme.dart' as Theme;

import './account/repository/account_repository.dart';
import './account/repository/account_repository_interface.dart';

void main() {
  AccountRepositoryInterface _accountRepository = AccountRepository();
  runApp(MyApp(
    accountRepository: _accountRepository,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({required this.accountRepository});

  final AccountRepositoryInterface accountRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: accountRepository,
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
