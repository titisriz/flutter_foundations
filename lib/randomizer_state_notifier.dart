import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'randomizer_state_notifier.freezed.dart';

@freezed
abstract class RandomizerState with _$RandomizerState {
  const RandomizerState._();
  const factory RandomizerState({
    @Default(0) int min,
    @Default(0) int max,
    int? generatedValue,
  }) = _RandomizerState;
}

class RandomizerStateNotifier extends StateNotifier<RandomizerState> {
  RandomizerStateNotifier(state) : super(state);
  final _randomGenerator = Random();
  void generateRandomNumber() {
    state = state.copyWith(
        generatedValue:
            state.min + _randomGenerator.nextInt(state.max + 1 - state.min));
  }

  void setMin(int value) {
    state = state.copyWith(min: value);
  }

  void setMax(int value) {
    state = state.copyWith(max: value);
  }
}

class RandomizerChangeNotifier extends StateNotifier {
  int? _generatedNumber;

  RandomizerChangeNotifier(state) : super(state);

  int? get generatedNumber => _generatedNumber;

  int min = 0, max = 0;
}
