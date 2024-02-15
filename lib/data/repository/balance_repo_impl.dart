import 'package:tiger_fortune_app/data/repository/balance_repo.dart';
import 'package:hive/hive.dart';

class BalanceRepositoryImpl extends BalanceRepository {
  static const balanceKey = 'balance1';

  final Box box;

  BalanceRepositoryImpl(this.box);

  @override
  int getLastBalance() => box.get(balanceKey, defaultValue: 40000);

  @override
  Future<int> saveBalance(int balance) async {
    box.put(balanceKey, balance);
    return balance;
  }
}

class LastClaimTimeRepositoryImpl extends LastClaimTimeRepository {
    static const lastClaimTimeKey = 'lastClaimTime';
  final Box box;

  LastClaimTimeRepositoryImpl(this.box);

  @override
  int getLastClaimTime() => box.get(lastClaimTimeKey, defaultValue: 0);

  @override
  Future<int> saveLastClaimTime(int lastClaimTime) async {
    box.put(lastClaimTimeKey, lastClaimTime);
    return lastClaimTime;
  }
}
