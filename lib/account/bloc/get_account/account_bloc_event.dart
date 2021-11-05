import 'package:equatable/equatable.dart';
import 'package:wallet_tracker/account/models/account.dart';

abstract class AccountFetchEvent extends Equatable {
  AccountFetchEvent();

  @override
  List<Object?> get props => [];
}

class AccountFetched extends AccountFetchEvent {}

class AccountListChanged extends AccountFetchEvent {
  final List<Account> newAccounts;

  AccountListChanged(this.newAccounts);

  @override
  List<Object?> get props => [newAccounts];
}
