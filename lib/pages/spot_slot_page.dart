import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiger_fortune_app/bloc/spots_page_cubit.dart';
import 'package:tiger_fortune_app/bloc/spots_page_state.dart';

class SpotSlotPage extends StatefulWidget {
  const SpotSlotPage({super.key});

  @override
  State<SpotSlotPage> createState() => _SpotSlotPageState();
}

class _SpotSlotPageState extends State<SpotSlotPage> {
  final SpotSlotCubit cubit = SpotSlotCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<SpotSlotCubit, SpotSlotState>(
          bloc: cubit,
          builder: (context, state) { 
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('CUBIT TESTING:'),
                Text('${state.bet}'),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: cubit.incrementBet,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: cubit.decrementBet,
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    
    );
  }
}
