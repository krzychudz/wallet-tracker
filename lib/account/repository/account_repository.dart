import 'dart:async';

import 'package:wallet_tracker/cache/manager/cache_interface.dart';

import './account_repository_interface.dart';
import '../models/account.dart';

class AccountRepository implements AccountRepositoryInterface {
  AccountRepository(
    this._cacheManager,
  );

  CacheInterface _cacheManager;

  final _controller = StreamController<List<Account>>();

  @override
  Stream<List<Account>> get accountState => _controller.stream;

  @override
  Future<void> createNewAccount(Account accountData) async {
    final newAccounts = await _cacheManager.putAccount(accountData);
    _controller.add(
      [...newAccounts],
    );
  }

  @override
  Future<List<Account>> getAccounts() async {
    final accounts = await _cacheManager.getAccounts();
    return [...accounts];
  }

  @override
  void dispose() => _controller.close();
}
