import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';

import '../../../screens/account/validators/account_name.dart';
import '/account/bloc/add_account/add_account_bloc_event.dart';
import '/account/bloc/add_account/add_account_bloc_state.dart';

class AddAccountBloc extends Bloc<AddAccountEvent, AddAccountState> {
  AddAccountBloc() : super(const AddAccountState()) {
    on<AccountNameChanged>(_onAccountNameChanged);
    on<AddAccountSubmited>(_onSubmitted);
  }

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

  void _onSubmitted(
    AddAccountSubmited event,
    Emitter<AddAccountState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        // TODO add account to repository
        await Future.delayed(
          Duration(seconds: 3),
        );
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (error) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
