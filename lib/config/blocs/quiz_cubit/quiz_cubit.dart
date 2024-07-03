import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:excuela/config/models/answers_model.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizState());

  void validAnswer() {
    emit(state.copyWith(isCorrectAnswer: true));
    Timer(const Duration(seconds: 3), () {
      if (state.currentQuestion != 2) {
        emit(state.copyWith(
            isCorrectAnswer: false,
            currentQuestion: state.currentQuestion + 1));
      } else {
        reset();
      }
    });
  }

  void reset() {
    emit(state.copyWith(currentQuestion: 0, isCorrectAnswer: null));
  }
}
