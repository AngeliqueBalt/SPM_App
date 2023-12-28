class QuestionModel {
  String question;
  Map<String, bool> answers;

  QuestionModel(String s, Map<String, bool> map,
      {required this.question, required this.answers});
}
