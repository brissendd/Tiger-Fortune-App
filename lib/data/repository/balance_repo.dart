abstract class BalanceRepository {
  int getLastBalance();

  Future<int> saveBalance(int count);
  
}