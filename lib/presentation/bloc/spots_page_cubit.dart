import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiger_fortune_app/presentation/bloc/spots_page_state.dart';

class SpotSlotCubit extends Cubit<SpotSlotState> {
  SpotSlotCubit() : super(const SpotSlotState(bet: 500));

  void incrementBet() {
    emit(SpotSlotState(bet: state.bet + 500));
  }

  void decrementBet() {
    emit(SpotSlotState(bet: state.bet - 500));
  }
}
