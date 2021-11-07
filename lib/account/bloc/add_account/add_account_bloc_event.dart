import 'package:equatable/equatable.dart';

abstract class AddAccountEvent extends Equatable {
  const AddAccountEvent();

  @override
  List<Object> get props => [];
}

class AccountNameChanged extends AddAccountEvent {
  const AccountNameChanged(this.accountName);

  final String accountName;

  @override
  List<Object> get props => [accountName];
}

class AccountSourceNameChanged extends AddAccountEvent {
  const AccountSourceNameChanged(this.accountSourceName);

  final String accountSourceName;

  @override
  List<Object> get props => [accountSourceName];
}

class AccountBalanceChanged extends AddAccountEvent {
  const AccountBalanceChanged(this.accountBalance);

  final String accountBalance;

  @override
  List<Object> get props => [accountBalance];
}

class AddAccountSubmited extends AddAccountEvent {
  const AddAccountSubmited();
}
