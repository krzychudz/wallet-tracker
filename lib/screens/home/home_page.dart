import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_tracker/account/bloc/account_bloc.dart';
import 'package:wallet_tracker/account/repository/account_repository.dart';

import '../home/home_view.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/home";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountFetchBloc(
        accountRepository: RepositoryProvider.of<AccountRepository>(context),
      ),
      child: HomeView(),
    );
  }
}
