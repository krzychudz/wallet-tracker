import 'package:hive/hive.dart';

import '../../account/models/account.dart';
import '../../cache/manager/cache_interface.dart';

class HiveCacheManager implements CacheInterface {
  static const String _accountBoxHiveName = "accounts";

  @override
  Future<List<Account>> getAccounts() async {
    final box = await Hive.openBox<Account>(_accountBoxHiveName);
    return box.values.toList();
  }

  @override
  Future<List<Account>> putAccount(Account account) async {
    final box = await Hive.openBox<Account>(_accountBoxHiveName);
    await box.put(account.id, account);
    return box.values.toList();
  }
}
