import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../account/bloc/add_account/add_account_bloc.dart';
import '../../account/bloc/add_account/add_account_bloc_event.dart';
import '../../account/bloc/add_account/add_account_bloc_state.dart';

class AddAccountScreen extends StatelessWidget {
  const AddAccountScreen({Key? key}) : super(key: key);

  void _showErrorSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Text('Coś poszło nie tak'),
        ),
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
      body: BlocListener<AddAccountBloc, AddAccountState>(
        listener: (context, state) => {
          if (state.status.isSubmissionSuccess)
            Navigator.of(context).pop()
          else if (state.status.isSubmissionFailure)
            _showErrorSnackbar(context)
        },
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
              textInputAction: TextInputAction.next);
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
          labelText: 'Nazwa banku',
        ),
        textInputAction: TextInputAction.next);
  }

  Widget _buildAccountBalanceForm(BuildContext context) {
    return TextField(
      key: const Key('addAccountForm_accountBalanceInput_textField'),
      onChanged: (accountBalance) => context.read<AddAccountBloc>().add(
            AccountBalanceChanged(accountBalance),
          ),
      style: Theme.of(context).textTheme.caption,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Stan Konta',
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r'^\d+(\.\d*)?$'),
        )
      ],
      textInputAction: TextInputAction.done,
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return BlocBuilder<AddAccountBloc, AddAccountState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Column(
          children: [
            if (state.status.isSubmissionInProgress)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
            ElevatedButton(
              key: const Key('addAccountForm_add_raisedButton'),
              child: Text("Dodaj konto"),
              onPressed: state.status.isInvalid || !state.status.isValidated
                  ? null
                  : () {
                      context.read<AddAccountBloc>().add(
                            AddAccountSubmited(),
                          );
                    },
            )
          ],
        );
      },
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
          _buildAccountBalanceForm(context),
          SizedBox(
            height: 16,
          ),
          _buildSubmitButton(context)
        ],
      ),
    );
  }
}
