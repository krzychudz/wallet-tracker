import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_tracker/account/repository/account_repository.dart';

import '../../account/bloc/add_account/add_account_bloc.dart';
import '../../screens/account/add_account.dart';

class AddAccountPage extends StatelessWidget {
  static String routeName = "/add_account";

  const AddAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddAccountBloc(
        accountRepository: RepositoryProvider.of<AccountRepository>(context),
      ),
      child: AddAccountScreen(),
    );
  }
}
