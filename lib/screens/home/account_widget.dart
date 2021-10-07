import 'package:flutter/material.dart';
import '../../account/models/account.dart';

class AccountView extends StatelessWidget {
  const AccountView({
    required this.account,
    Key? key,
  }) : super(key: key);

  final Account account;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        account.name,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
