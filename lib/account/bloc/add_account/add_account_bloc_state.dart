import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../screens/account/validators/account_name.dart';

class AddAccountState extends Equatable {
  const AddAccountState({
    this.status = FormzStatus.pure,
    this.accountName = const AccountName.pure(),
  });

  final FormzStatus status;
  final AccountName accountName;

  AddAccountState copyWith({
    FormzStatus? status,
    AccountName? accountName,
  }) {
    return AddAccountState(
      status: status ?? this.status,
      accountName: accountName ?? this.accountName,
    );
  }

  @override
  List<Object?> get props => [status, accountName];
}
