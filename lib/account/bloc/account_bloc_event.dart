import 'package:equatable/equatable.dart';

abstract class AccountFetchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AccountFetched extends AccountFetchEvent {}
