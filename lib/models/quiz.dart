import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz.freezed.dart';

part 'quiz.g.dart';

@freezed
class Quiz with _$Quiz {
  const factory Quiz({
    required String name,
    required List<Question> questions,
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}

@freezed
class Question with _$Question {
  const factory Question({
    required String question,
    required List<Answer> answers,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  factory Question.empty({required int answerCount}) => Question(
      question: "",
      answers: List.filled(
        answerCount,
        Answer.empty,
      ));
}

@freezed
class Answer with _$Answer {
  const factory Answer({
    required String answer,
    required bool isCorrect,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  static const Answer empty = Answer(answer: "", isCorrect: false);
}
