import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import 'package:hive/hive.dart';

part 'account.g.dart';

@HiveType(typeId: 1)
class Account extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int balance;
  @HiveField(3)
  final String bankName;

  Account({
    required this.name,
    required this.bankName,
    this.balance = 0,
  }) : id = Uuid().v4();

  @override
  List<Object?> get props => [id, name, balance, bankName];
}
