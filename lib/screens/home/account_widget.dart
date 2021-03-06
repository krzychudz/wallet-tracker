import 'package:flutter/material.dart';
import '../../account/models/account.dart';
import '../../extensions/number_extension.dart';

class AccountView extends StatelessWidget {
  const AccountView({
    required this.account,
    Key? key,
  }) : super(key: key);

  final Account account;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                child: Container(
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        account.name,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        account.bankName,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dostępne środki",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontSize: 11.0,
                        ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    account.balance.toAccountBalance(),
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 11.0,
                        ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
        ),
      ],
    );
  }
}
