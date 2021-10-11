import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/account_repository.dart';
import './account_bloc_event.dart';
import './account_bloc_state.dart';

class AccountFetchBloc extends Bloc<AccountFetchEvent, AccountFetchState> {
  AccountFetchBloc(this._accountRepository) : super(AccountFetchState()) {
    on<AccountFetched>(_onFetchEvent);
  }

  final AccountRepository _accountRepository;

  Future<void> _onFetchEvent(
      AccountFetchEvent event, Emitter<AccountFetchState> emit) async {
    emit(state.copyWith(status: AccountStatus.inProgress));
    var accountsData = await _accountRepository.getAccounts();
    emit(state.copyWith(status: AccountStatus.success, data: accountsData));
  }
}
