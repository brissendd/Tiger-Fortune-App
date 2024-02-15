import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiger_fortune_app/di.dart';
import 'package:tiger_fortune_app/presentation/bloc/balance_state.dart';

class BalanceCubit extends Cubit<BalanceState> {
  final balanceCases = DI.getInstance().balanceCase;
  final lastClaimTimeCases = DI.getInstance().lastClaimTimeCase;

  BalanceCubit() : super(const BalanceState(lastClaimTime: 0, balance: 40000)) {
    emit(BalanceState(
        lastClaimTime: lastClaimTimeCases.getLastClaimTime(),
        balance: balanceCases.getLastBalance()));
  }

  getCurrentTime() {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    return currentTime;
  }

  Future<void> claimReward() async {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    final _savedValue = await balanceCases.saveBalance(state.balance + 200);
    final _timeLeft = await lastClaimTimeCases.saveLastClaimTime(
        state.lastClaimTime - state.lastClaimTime + currentTime);
    emit(BalanceState(balance: _savedValue, lastClaimTime: _timeLeft));
    // ignore: avoid_print
    print('YEY, now you have ${state.balance}');
  }

  getLastBalance() {
    final balance = balanceCases.getLastBalance();
    return balance;
  }
}
