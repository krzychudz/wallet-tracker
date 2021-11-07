import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Account extends Equatable {
  final String id;
  final String name;
  final int balance;
  final String bankName;

  Account({
    required this.name,
    required this.bankName,
    this.balance = 0,
  }) : id = Uuid().v4();

  @override
  List<Object?> get props => [id, name, balance, bankName];
}
