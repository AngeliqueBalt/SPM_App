// List of sample questions for the quiz
// Questions will be collected from the add new quiz screen/database?

import 'package:student_progress_monitor_app/models/quiz.dart';

List<Question> questions = [
  Question(
    question: 'What does CPU stand for?',
    answers: [
      Answer(answer: "Central Processing Unit", isCorrect: true),
      Answer(answer: "Computer Personal Unit", isCorrect: false),
      Answer(answer: "Central Process Unit", isCorrect: false),
      Answer(answer: "Central Peripheral Unit", isCorrect: false),
    ],
  ),
  Question(
    question: 'What does RAM stand for?',
    answers: [
      Answer(answer: "Random Access Memory", isCorrect: true),
      Answer(answer: "Random Access Machine", isCorrect: false),
      Answer(answer: "Random Access Module", isCorrect: false),
      Answer(answer: "Random Access Method", isCorrect: false),
    ],
  ),
  Question(
    question: 'What does ROM stand for?',
    answers: [
      Answer(answer: "Read Only Memory", isCorrect: true),
      Answer(answer: "Read Only Machine", isCorrect: false),
      Answer(answer: "Read Only Module", isCorrect: false),
      Answer(answer: "Read Only Method", isCorrect: false),
    ],
  ),
  Question(
    question: 'What does GPU stand for?',
    answers: [
      Answer(answer: "Graphics Processing Unit", isCorrect: true),
      Answer(answer: "Graphics Personal Unit", isCorrect: false),
      Answer(answer: "Graphics Process Unit", isCorrect: false),
      Answer(answer: "Graphics Peripheral Unit", isCorrect: false),
    ],
  ),
  Question(
    question: 'What is the purpose of a web browser?',
    answers: [
      Answer(answer: "To create documents", isCorrect: false),
      Answer(answer: "To play games", isCorrect: false),
      Answer(answer: "To browse websites", isCorrect: true),
      Answer(answer: "To edit images", isCorrect: false),
    ],
  ),
  Question(
    question: 'Which file format is commonly used for compressed archives?',
    answers: [
      Answer(answer: "TXT", isCorrect: false),
      Answer(answer: "ZIP", isCorrect: true),
      Answer(answer: "EXE", isCorrect: false),
      Answer(answer: "DOC", isCorrect: false),
    ],
  ),
  Question(
    question: 'Which of the following is a programming language?',
    answers: [
      Answer(answer: "JPEG", isCorrect: false),
      Answer(answer: "GIF", isCorrect: false),
      Answer(answer: "Python", isCorrect: true),
      Answer(answer: "PNG", isCorrect: false),
    ],
  ),
  Question(
    question: 'Which is the file extension of a text file?',
    answers: [
      Answer(answer: ".txt", isCorrect: true),
      Answer(answer: ".doc", isCorrect: false),
      Answer(answer: ".exe", isCorrect: false),
      Answer(answer: ".jpg", isCorrect: false),
    ],
  ),
  Question(
    question: 'What does the "WWW" in a website URL stand for?',
    answers: [
      Answer(answer: "Web World Wide", isCorrect: false),
      Answer(answer: "Web World Wonders", isCorrect: false),
      Answer(answer: "Wide World Web", isCorrect: false),
      Answer(answer: "World Wide Web", isCorrect: true),
    ],
  ),
  Question(
    question: 'Which device is used to input data into a computer?',
    answers: [
      Answer(answer: "Monitor", isCorrect: false),
      Answer(answer: "Keyboard", isCorrect: true),
      Answer(answer: "Printer", isCorrect: false),
      Answer(answer: "Speakers", isCorrect: false),
    ],
  ),
];
