import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../screens/account/validators/account_name.dart';

class AddAccountState extends Equatable {
  const AddAccountState(
      {this.status = FormzStatus.pure,
      this.accountName = const AccountName.pure(),
      this.accountSource = ""});

  final FormzStatus status;
  final AccountName accountName;
  final String accountSource;

  AddAccountState copyWith({
    FormzStatus? status,
    AccountName? accountName,
    String? accountSource,
  }) {
    return AddAccountState(
        status: status ?? this.status,
        accountName: accountName ?? this.accountName,
        accountSource: accountSource ?? this.accountSource);
  }

  @override
  List<Object?> get props => [status, accountName];
}
