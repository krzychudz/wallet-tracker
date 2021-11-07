import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../screens/account/validators/account_name.dart';

class AddAccountState extends Equatable {
  const AddAccountState({
    this.status = FormzStatus.pure,
    this.accountName = const AccountName.pure(),
    this.accountSource = "",
    this.accountBalance = "",
  });

  final FormzStatus status;
  final AccountName accountName;
  final String accountSource;
  final String accountBalance;

  AddAccountState copyWith(
      {FormzStatus? status,
      AccountName? accountName,
      String? accountSource,
      String? accountBalance}) {
    return AddAccountState(
      status: status ?? this.status,
      accountName: accountName ?? this.accountName,
      accountSource: accountSource ?? this.accountSource,
      accountBalance: accountBalance ?? this.accountBalance,
    );
  }

  @override
  List<Object?> get props =>
      [status, accountName, accountSource, accountBalance];
}
