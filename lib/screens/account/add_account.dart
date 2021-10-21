import 'package:flutter/material.dart';

class AddAccountScreen extends StatelessWidget {
  static String routeName = "/add_account";

  const AddAccountScreen({Key? key}) : super(key: key);

  Widget _buildAccountNameForm() {
    return TextField(
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Nazwa konta',
      ),
    );
  }

  Widget _buildAccountInfoForm() {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Informacje o koncie',
      ),
      maxLines: 2,
      maxLength: 50,
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      child: Text("Dodaj konto"),
      onPressed: () => {},
    );
  }

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
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildAccountNameForm(),
            SizedBox(
              height: 16,
            ),
            _buildAccountInfoForm(),
            SizedBox(
              height: 16,
            ),
            _buildSubmitButton()
          ],
        ),
      ),
    );
  }
}
