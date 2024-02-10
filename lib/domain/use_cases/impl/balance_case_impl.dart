import 'package:tiger_fortune_app/domain/use_cases/interfaces/balance_case.dart';
import 'package:tiger_fortune_app/repository/balance_repo.dart';

class BalanceCaseImpl extends BalanceCase {
final BalanceRepository _balanceRepository;

  BalanceCaseImpl(this._balanceRepository);
  
  @override
  int getLastBalance() => _balanceRepository.getLastBalance();
  
  @override
  Future<int> saveBalance(int count) => _balanceRepository.saveBalance(count);


}