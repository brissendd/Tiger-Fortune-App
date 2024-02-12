abstract class BalanceRepository {
  int getLastBalance();

  Future<int> saveBalance(int balance);
}

abstract class LastClaimTimeRepository {
  int getLastClaimTime();
  
  Future<int> saveLastClaimTime(int lastClaimTime);
}
