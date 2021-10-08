import 'package:flutter/material.dart';
import 'package:wallet_tracker/account/models/account.dart';
import './account_widget.dart';

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
      child: Column(
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
          AccountView(
            account: Account(
              id: "1",
              name: "First Account",
              additionalInfo: "PKO BP",
              balance: 1500000,
            ),
          ),
          AccountView(
            account: Account(
              id: "2",
              name: "Second Account",
              additionalInfo: "Santander",
              balance: 3150000,
            ),
          ),
        ],
      ),
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
