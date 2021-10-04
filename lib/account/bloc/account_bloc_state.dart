import 'package:equatable/equatable.dart';

import '../models/account.dart';

enum AccountStatus { initial, success, failure }

class AccountFetchState extends Equatable {
  final AccountStatus status;
  final List<Account> data;

  const AccountFetchState({
    this.status = AccountStatus.initial,
    this.data = const <Account>[],
  });

  AccountFetchState copyWith({
    AccountStatus? status,
    List<Account>? data,
  }) {
    return AccountFetchState(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  @override
  List<Object> get props => [data];
}
