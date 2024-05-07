import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/quiz.dart';
import 'package:student_progress_monitor_app/screens/teacher/quiz_overview_screen.dart';

/// A form to create a new quiz.
/// Teachers can fill into the form to create a new quiz, giving the question and answer options and mark the correct answer.
/// After creating the quiz, the teacher can view the quiz overview screen to see the quiz they just created and save the quiz.

class NewQuizScreen extends StatefulWidget {
  final String classId;

  const NewQuizScreen({
    super.key,
    required this.classId,
  });

  @override
  State<NewQuizScreen> createState() => _NewQuizScreenState();
}

class _NewQuizScreenState extends State<NewQuizScreen> {
  static const quizLength = 10;
  static const answerCount = 4;

  final PageController _controller = PageController(initialPage: 0);

  final List<GlobalKey<FormState>> _formKeys =
      List.generate(quizLength, (final _) => GlobalKey<FormState>());

  bool get isFirstPage => _controller.hasClients ? _controller.page! < 1 : true;

  bool get isLastPage =>
      _controller.hasClients ? _controller.page! + 1 >= quizLength : false;

  final questions = List.filled(
    quizLength,
    Question.empty(answerCount: answerCount),
  );

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Create New Quiz",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: greenColor,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        itemCount: quizLength,
        itemBuilder: (final context, final index) {
          return NewQuizScreenQuestion(
            quizLength: quizLength,
            index: index,
            question: questions[index],
            onQuestionChanged: (final question) {
              setState(() {
                questions[index] = question;
              });
            },
            formKey: _formKeys[index],
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),

              // Buttons for next question and save question
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IgnorePointer(
                    ignoring: isFirstPage,
                    child: AnimatedOpacity(
                      opacity: isFirstPage ? 0.0 : 1.0,
                      duration: kAnimationDuration,
                      curve: kAnimationCurve,
                      child: OutlinedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        onPressed: previousPage,
                        child: const Text("Previous"),
                      ),
                    ),
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    onPressed: nextPage,
                    child: Text(isLastPage ? "Preview" : "Next"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void nextPage() {
    if (!_formKeys[_controller.page!.round()].currentState!.validate()) {
      return;
    }

    if (_controller.page == null) return;

    if (isLastPage) {
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (final context) => QuizOverviewScreen(
            quiz: Quiz(
              id: '',
              name: '',
              questions: questions,
              classId: widget.classId,
            ),
          ),
        ),
      );
      return;
    }

    _controller.nextPage(
      duration: kAnimationDuration,
      curve: kAnimationCurve,
    );
  }

  void previousPage() {
    if (_controller.page == null) return;
    if (isFirstPage) return;

    _controller.previousPage(
      duration: kAnimationDuration,
      curve: kAnimationCurve,
    );
  }
}

class NewQuizScreenQuestion extends StatefulWidget {
  final int quizLength;
  final int index;

  final Question question;

  final void Function(Question) onQuestionChanged;

  final GlobalKey<FormState>? formKey;

  const NewQuizScreenQuestion({
    super.key,
    required this.question,
    required this.quizLength,
    required this.index,
    required this.onQuestionChanged,
    this.formKey,
  });

  @override
  State<NewQuizScreenQuestion> createState() => _NewQuizScreenQuestionState();
}

class _NewQuizScreenQuestionState extends State<NewQuizScreenQuestion> {
  final ScrollController _scrollController = ScrollController();
  late final TextEditingController _questionController;

  @override
  void initState() {
    _questionController = TextEditingController(text: widget.question.question);
    _questionController.addListener(() {
      widget.onQuestionChanged(widget.question.copyWith(
        question: _questionController.text,
      ));
    });

    super.initState();
  }

  @override
  void dispose() {
    _questionController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Question ${widget.index + 1}/${widget.quizLength}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w300, fontSize: 28),
                  ),
                ),
                const Divider(
                  height: 20,
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),

                // Quiz form
                const Text(
                  "Enter Question",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _questionController,
                  validator: (final value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "You need to enter a question.";
                    }
                    if (widget.question.answers
                        .every((final answer) => !answer.isCorrect)) {
                      return "At least one answer must be marked as correct.";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter your question here",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Enter Answer Options",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 20,
                ),
                for (int i = 0; i < widget.question.answers.length; i++)
                  NewQuizScreenAnswer(
                    answer: widget.question.answers[i],
                    index: i,
                    onAnswerChanged: (final answer) {
                      final answers = [...widget.question.answers];
                      answers[i] = answer;
                      widget.onQuestionChanged(
                        widget.question.copyWith(answers: answers),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewQuizScreenAnswer extends StatefulWidget {
  final Answer answer;
  final int index;

  final void Function(Answer) onAnswerChanged;

  const NewQuizScreenAnswer({
    super.key,
    required this.answer,
    required this.index,
    required this.onAnswerChanged,
  });

  @override
  State<NewQuizScreenAnswer> createState() => _NewQuizScreenAnswerState();
}

class _NewQuizScreenAnswerState extends State<NewQuizScreenAnswer> {
  late final TextEditingController _answerController;

  @override
  void initState() {
    _answerController = TextEditingController(text: widget.answer.answer);
    _answerController.addListener(() {
      widget.onAnswerChanged(widget.answer.copyWith(
        answer: _answerController.text,
      ));
    });

    super.initState();
  }

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextFormField(
                controller: _answerController,
                validator: (final value) => value?.trim().isEmpty ?? true
                    ? "You need to enter a answer"
                    : null,
                decoration: InputDecoration(
                  hintText: "Enter option ${widget.index + 1}",
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            Checkbox(
              value: widget.answer.isCorrect,
              onChanged: (final bool? newValue) {
                widget.onAnswerChanged(
                  widget.answer.copyWith(
                    isCorrect: newValue ?? false,
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
