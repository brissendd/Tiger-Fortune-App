abstract class BalanceCase {
  int getLastBalance();

  Future<int> saveBalance(int balance);
}

abstract class LastClaimTimeCase {
  int getLastClaimTime();
  Future<int> saveLastClaimTime(int lastClaimTime);
}
