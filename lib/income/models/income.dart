import 'package:equatable/equatable.dart';

class Income extends Equatable {
  final String id;
  final String accountId;
  final int amount;
  final String additinalInfo;
  final DateTime date;

  Income({
    required this.id,
    required this.accountId,
    required this.amount,
    required this.date,
    this.additinalInfo = "",
  });

  @override
  List<Object?> get props => [id, accountId, amount, date, additinalInfo];
}
