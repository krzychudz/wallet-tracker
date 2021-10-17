import 'package:flutter/material.dart';

class AddAccountScreen extends StatelessWidget {
  static String routeName = "/add_account";

  const AddAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Dodaj konto",
          style: Theme.of(context).textTheme.headline1,
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Container(
        child: Text("Add Account"),
      ),
    );
  }
}
