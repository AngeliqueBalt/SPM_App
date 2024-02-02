// List of sample questions for the quiz
// Questions will be collected from the add new quiz screen/database?

import 'package:student_progress_monitor_app/models/question_model.dart';

List<QuestionModel> questions = [
  QuestionModel(
    question: 'What does CPU stand for?',
    answers: {
      "Central Processing Unit": true,
      "Computer Personal Unit": false,
      "Central Process Unit": false,
      "Central Peripheral Unit": false,
    },
  ),
  QuestionModel(
    question: 'What does RAM stand for?',
    answers: {
      "Random Access Memory": true,
      "Random Access Machine": false,
      "Random Access Module": false,
      "Random Access Method": false,
    },
  ),
  QuestionModel(
    question: 'What does ROM stand for?',
    answers: {
      "Read Only Memory": true,
      "Read Only Machine": false,
      "Read Only Module": false,
      "Read Only Method": false,
    },
  ),
  QuestionModel(
    question: 'What does GPU stand for?',
    answers: {
      "Graphics Processing Unit": true,
      "Graphics Personal Unit": false,
      "Graphics Process Unit": false,
      "Graphics Peripheral Unit": false,
    },
  ),
  QuestionModel(
    question: 'What is the purpose of a web browser?',
    answers: {
      "To create documents": false,
      "To play games": false,
      "To browse websites": true,
      "To edit images": false,
    },
  ),
  QuestionModel(
    question: 'Which file format is commonly used for compressed archives?',
    answers: {
      "TXT": false,
      "ZIP": true,
      "EXE": false,
      "DOC": false,
    },
  ),
  QuestionModel(
    question: 'Which of the following is a programming language?',
    answers: {
      "JPEG": false,
      "GIF": false,
      "Python": true,
      "PNG": false,
    },
  ),
  QuestionModel(
    question: 'Which is the file extension of a text file?',
    answers: {
      ".txt": true,
      ".doc": false,
      ".exe": false,
      ".jpg": false,
    },
  ),
  QuestionModel(
    question: 'What does the "WWW" in a website URL stand for?',
    answers: {
      "Web World Wide": false,
      "Web World Wonders": false,
      "Wide World Web": false,
      "World Wide Web": true,
    },
  ),
  QuestionModel(
    question: 'Which device is used to input data into a computer?',
    answers: {
      "Monitor": false,
      "Keyboard": true,
      "Printer": false,
      "Speakers": false,
    },
  ),
];
