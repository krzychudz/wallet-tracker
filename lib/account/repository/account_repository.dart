import 'dart:async';

import './account_repository_interface.dart';
import '../models/account.dart';

class AccountRepository implements AccountRepositoryInterface {
  AccountRepository();

  final _controller = StreamController<List<Account>>();

  @override
  Stream<List<Account>> get accountState => _controller.stream;

  List<Account> _accounts = [];

  @override
  Future<bool> createNewAccount(Account accountData) {
    return Future.delayed(
      Duration(seconds: 3),
      () {
        _accounts.add(accountData);
        _controller.add([..._accounts]);
        return true;
      },
    );
  }

  @override
  Future<List<Account>> getAccounts() async {
    return await Future.delayed(
      Duration(seconds: 3),
      () => [..._accounts],
    );
  }

  @override
  void dispose() => _controller.close();
}
