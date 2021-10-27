import '../models/account.dart';

abstract class AccountRepositoryInterface {
  Future<List<Account>> getAccounts();
  Future<bool> createNewAccount(Account accountData);
  Stream<List<Account>> get accountState;

  void dispose();
}
