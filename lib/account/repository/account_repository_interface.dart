import '../models/account.dart';

abstract class AccountRepositoryInterface {
  Future<List<Account>> getAccounts();
  Future<void> createNewAccount(Account accountData);
  Stream<List<Account>> get accountState;

  void dispose();
}
