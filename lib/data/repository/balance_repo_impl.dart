import 'package:tiger_fortune_app/data/repository/balance_repo.dart';
import 'package:hive/hive.dart';

class BalanceRepositoryImpl extends BalanceRepository {
  static const boxKey = 'balance';

  final Box box;

  BalanceRepositoryImpl(this.box);

  @override
  int getLastBalance() => box.get(boxKey, defaultValue: 50000);

  @override
  Future<int> saveBalance(int count) async {
    box.put(boxKey, count);
    return count;
  }
}
