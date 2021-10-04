import 'package:flutter_bloc/flutter_bloc.dart';
import './account_bloc_event.dart';
import './account_bloc_state.dart';

class AccountFetchBloc extends Bloc<AccountFetchEvent, AccountFetchState> {
  AccountFetchBloc() : super(AccountFetchState()) {
    on<AccountFetched>(_onFetchEvent);
  }

  Future<void> _onFetchEvent(
      AccountFetchEvent event, Emitter<AccountFetchState> emit) async {
    //TODO fetch the accounts
  }
}
