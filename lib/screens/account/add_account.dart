import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../account/bloc/add_account/add_account_bloc.dart';
import '../../account/bloc/add_account/add_account_bloc_event.dart';
import '../../account/bloc/add_account/add_account_bloc_state.dart';

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
          color: Colors.black,
        ),
      ),
      body: BlocProvider(
        create: (_) => AddAccountBloc(),
        child: AddAccountForm(),
      ),
    );
  }
}

class AddAccountForm extends StatelessWidget {
  const AddAccountForm({Key? key}) : super(key: key);

  Widget _buildAccountNameForm(BuildContext context) {
    return BlocBuilder<AddAccountBloc, AddAccountState>(
        buildWhen: (previous, current) =>
            previous.accountName != current.accountName,
        builder: (context, state) {
          return TextField(
            key: const Key('addAccountForm_accountNameInput_textField'),
            onChanged: (accountName) => context
                .read<AddAccountBloc>()
                .add(AccountNameChanged(accountName)),
            style: Theme.of(context).textTheme.caption,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Nazwa konta',
              errorText: state.accountName.invalid
                  ? 'Nazwa konta nie może być pusta'
                  : null,
            ),
          );
        });
  }

  Widget _buildAccountSourceForm(BuildContext context) {
    return TextField(
      key: const Key('addAccountForm_accountSourceInput_textField'),
      onChanged: (accountSourceName) => context.read<AddAccountBloc>().add(
            AccountSourceNameChanged(accountSourceName),
          ),
      style: Theme.of(context).textTheme.caption,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Nazwa operatora',
      ),
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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildAccountNameForm(context),
          SizedBox(
            height: 16,
          ),
          _buildAccountSourceForm(context),
          SizedBox(
            height: 16,
          ),
          _buildSubmitButton()
        ],
      ),
    );
  }
}
