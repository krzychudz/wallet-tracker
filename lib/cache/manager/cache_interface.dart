import '../../account/models/account.dart';

abstract class CacheInterface {
  Future<List<Account>> putAccount(Account account);
  Future<List<Account>> getAccounts();
}
