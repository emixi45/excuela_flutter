part of 'quiz_cubit.dart';

class QuizState {
  int currentQuestion = 0;
  bool? isCorrectAnswer;
  final List<String> questions = ["pregunta 1", "pregunta 2", "pregunta 3"];
  final Map<String, List<AnswersModel>> answers = {
    "pregunta 1": [
      AnswersModel(answer: "correcta", valid: true),
      AnswersModel(answer: "incorrecta", valid: false),
      AnswersModel(answer: "incorrecta", valid: false),
      AnswersModel(answer: "incorrecta", valid: false),
    ],
    "pregunta 2": [
      AnswersModel(answer: "incorrecta", valid: false),
      AnswersModel(answer: "incorrecta", valid: false),
      AnswersModel(answer: "correcta", valid: true),
      AnswersModel(answer: "incorrecta", valid: false),
    ],
    "pregunta 3": [
      AnswersModel(answer: "incorrecta", valid: false),
      AnswersModel(answer: "correcta", valid: true),
      AnswersModel(answer: "incorrecta", valid: false),
      AnswersModel(answer: "incorrecta", valid: false),
    ],
  };

  QuizState({this.isCorrectAnswer, this.currentQuestion = 0});

  copyWith({
    int? currentQuestion,
    bool? isCorrectAnswer,
  }) =>
      QuizState(
        currentQuestion: currentQuestion ?? this.currentQuestion,
        isCorrectAnswer: isCorrectAnswer,
      );
}
