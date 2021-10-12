import './account_repository_interface.dart';
import '../models/account.dart';

class AccountRepository implements AccountRepositoryInterface {
  AccountRepository();

  @override
  Future<bool> createNewAccount(Account accountData) {
    // TODO: implement createNewAccount
    throw UnimplementedError();
  }

  @override
  Future<List<Account>> getAccounts() async {
    //TODO: Change mocked data once db is ready
    List<Account> mockedAccounts = [
      Account(
        id: "1",
        name: "First Account",
        additionalInfo: "PKO BP",
        balance: 1500000,
      ),
      Account(
        id: "2",
        name: "Second Account",
        additionalInfo: "Santander",
        balance: 3150000,
      ),
    ];

    return await Future.delayed(Duration(seconds: 3), () => mockedAccounts);
  }
}
