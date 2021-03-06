import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';

import '../../../account/models/account.dart';
import '../../../account/repository/account_repository_interface.dart';

import '../../../screens/account/validators/account_name.dart';
import '/account/bloc/add_account/add_account_bloc_event.dart';
import '/account/bloc/add_account/add_account_bloc_state.dart';

class AddAccountBloc extends Bloc<AddAccountEvent, AddAccountState> {
  AddAccountBloc({
    required AccountRepositoryInterface accountRepository,
  })  : _accountRepository = accountRepository,
        super(const AddAccountState()) {
    on<AccountNameChanged>(_onAccountNameChanged);
    on<AddAccountSubmited>(_onSubmitted);
    on<AccountSourceNameChanged>(_onAccountSourceNameChanged);
    on<AccountBalanceChanged>(_onAccountBalanceNameChanged);
  }

  final AccountRepositoryInterface _accountRepository;

  void _onAccountNameChanged(
      AccountNameChanged event, Emitter<AddAccountState> emit) {
    final accountName = AccountName.dirty(event.accountName);
    emit(
      state.copyWith(
        accountName: accountName,
        status: Formz.validate([accountName]),
      ),
    );
  }

  void _onAccountSourceNameChanged(
      AccountSourceNameChanged event, Emitter<AddAccountState> emit) {
    emit(
      state.copyWith(accountSource: event.accountSourceName),
    );
  }

  void _onAccountBalanceNameChanged(
      AccountBalanceChanged event, Emitter<AddAccountState> emit) {
    emit(
      state.copyWith(accountBalance: event.accountBalance),
    );
  }

  void _onSubmitted(
    AddAccountSubmited event,
    Emitter<AddAccountState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        var accountBalanceParsed = state.accountBalance.isEmpty
            ? 0
            : (double.parse(state.accountBalance) * 100).toInt();

        final accountData = Account(
          name: state.accountName.value,
          bankName: state.accountSource,
          balance: accountBalanceParsed,
        );
        await _accountRepository.createNewAccount(accountData);
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (error) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
