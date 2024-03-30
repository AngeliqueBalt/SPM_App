import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_progress_monitor_app/models/class.dart';

part 'quiz.freezed.dart';

part 'quiz.g.dart';

@freezed
class Quiz with _$Quiz {
  const factory Quiz({
    required final String id,
    required final String name,
    required final List<Question> questions,
    @JsonKey(name: "class") required final String classId,
  }) = _Quiz;

  factory Quiz.fromJson(final Map<String, dynamic> json) =>
      _$QuizFromJson(json);
}

@freezed
class Question with _$Question {
  const factory Question({
    required final String question,
    required final List<Answer> answers,
  }) = _Question;

  factory Question.fromJson(final Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  factory Question.empty({required final int answerCount}) => Question(
        question: "",
        answers: List.filled(
          answerCount,
          Answer.empty,
        ),
      );
}

@freezed
class Answer with _$Answer {
  const factory Answer({
    required final String answer,
    required final bool isCorrect,
  }) = _Answer;

  factory Answer.fromJson(final Map<String, dynamic> json) =>
      _$AnswerFromJson(json);

  static const Answer empty = Answer(answer: "", isCorrect: false);
}
