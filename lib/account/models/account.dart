import 'package:equatable/equatable.dart';

class Account extends Equatable {
  final String id;
  final String name;
  final int balance;
  final String additionalInfo;

  Account({
    required this.id,
    required this.name,
    required this.balance,
    required this.additionalInfo,
  });

  @override
  List<Object?> get props => [id, name, balance, additionalInfo];
}
