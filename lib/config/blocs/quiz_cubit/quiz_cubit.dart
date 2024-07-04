import 'dart:async';

import 'package:excuela/config/models/answers_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizState());

  void validAnswer(bool isValid) {
    emit(state.copyWith(isCorrectAnswer: isValid));
    Timer(const Duration(seconds: 1), () {
      if (state.currentQuestion != 2) {
        emit(state.copyWith(
            isCorrectAnswer: null, currentQuestion: state.currentQuestion + 1));
      } else {
        reset();
      }
    });
  }

  void reset() {
    emit(state.copyWith(currentQuestion: 0, isCorrectAnswer: null));
  }
}
