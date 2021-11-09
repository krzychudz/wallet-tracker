import 'package:hive_flutter/hive_flutter.dart';
import '../../account/models/account.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AccountAdapter());
}
