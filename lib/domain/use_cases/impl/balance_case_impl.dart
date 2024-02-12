import 'package:tiger_fortune_app/domain/use_cases/interfaces/balance_case.dart';
import 'package:tiger_fortune_app/data/repository/balance_repo.dart';

class BalanceCaseImpl extends BalanceCase {
  final BalanceRepository _balanceRepository;

  BalanceCaseImpl(this._balanceRepository);

  @override
  int getLastBalance() => _balanceRepository.getLastBalance();

  @override
  Future<int> saveBalance(int balance) =>
      _balanceRepository.saveBalance(balance);
}

class LastClaimTimeCaseImpl extends LastClaimTimeCase {
  final LastClaimTimeRepository _lastClaimTimeRepository;

  LastClaimTimeCaseImpl(this._lastClaimTimeRepository);

  @override
  int getLastClaimTime() => _lastClaimTimeRepository.getLastClaimTime();

  @override
  Future<int> saveLastClaimTime(int lastClaimTime) =>
      _lastClaimTimeRepository.saveLastClaimTime(lastClaimTime);
}
