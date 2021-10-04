import 'package:wallet_tracker/account/models/account.dart';

import './account_repository_interface.dart';

class AccountRepository implements AccountRepositoryInterface {
  @override
  Future<bool> createNewAccount(Account accountData) {
    // TODO: implement createNewAccount
    throw UnimplementedError();
  }

  @override
  Future<List<Account>> getAccounts() {
    // TODO: implement getAccounts
    throw UnimplementedError();
  }
}
