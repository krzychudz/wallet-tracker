import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../account/bloc/account_bloc.dart';
import '../../account/bloc/account_bloc_state.dart';
import '../../account/models/account.dart';
import './account_widget.dart';
import './total_balance.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget buildAccountsSection(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 1.0,
          ),
        ],
      ),
      child: BlocBuilder<AccountFetchBloc, AccountFetchState>(
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (context, snapshot) {
            return snapshot.status == AccountStatus.inProgress
                ? buildCenteredProgressIndicator()
                : buildAccountsView(
                    data: snapshot.data,
                    context: context,
                  );
          }),
    );
  }

  Widget buildCenteredProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget buildAccountsView(
      {required List<Account> data, required BuildContext context}) {
    int accountsTotalBalance = data.fold(
        0, (previousValue, element) => previousValue += element.balance);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Źródła",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Divider(
          height: 2,
        ),
        ...data.map(
          (accountData) => AccountView(
            account: Account(
                id: accountData.id,
                name: accountData.name,
                balance: accountData.balance,
                additionalInfo: accountData.additionalInfo),
          ),
        ),
        TotalBalance(totalBalance: accountsTotalBalance),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wallet\ntracker",
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [
          IconButton(
            onPressed: () => {},
            color: Theme.of(context).accentColor,
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 16,
        ),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              buildAccountsSection(context),
            ],
          ),
        ),
      ),
    );
  }
}
