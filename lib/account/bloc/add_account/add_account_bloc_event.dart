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

class AddAccountSubmited extends AddAccountEvent {
  const AddAccountSubmited();
}
