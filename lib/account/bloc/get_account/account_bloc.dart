import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../account/repository/account_repository_interface.dart';

import 'account_bloc_event.dart';
import 'account_bloc_state.dart';

class AccountFetchBloc extends Bloc<AccountFetchEvent, AccountFetchState> {
  AccountFetchBloc({required AccountRepositoryInterface accountRepository})
      : _accountRepository = accountRepository,
        super(
          AccountFetchState(),
        ) {
    on<AccountFetched>(_onFetchEvent);
    on<AccountListChanged>(_onNewAccountStateEvent);

    _accountsStateSubscription =
        _accountRepository.accountState.listen((accountList) {
      add(AccountListChanged(accountList));
    });
  }

  final AccountRepositoryInterface _accountRepository;

  late StreamSubscription _accountsStateSubscription;

  Future<void> _onFetchEvent(
      AccountFetchEvent event, Emitter<AccountFetchState> emit) async {
    emit(state.copyWith(status: AccountStatus.inProgress));
    var accountsData = await _accountRepository.getAccounts();
    emit(state.copyWith(status: AccountStatus.success, data: accountsData));
  }

  Future<void> _onNewAccountStateEvent(
      AccountListChanged event, Emitter<AccountFetchState> emit) async {
    emit(
      state.copyWith(status: AccountStatus.success, data: event.newAccounts),
    );
  }

  @override
  Future<void> close() {
    _accountsStateSubscription.cancel();
    _accountRepository.dispose();
    return super.close();
  }
}
