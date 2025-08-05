import 'package:flutter/material.dart';
import 'package:quiz_app/image_button.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_screen.dart';

// The main widget for our quiz app. Since the UI changes as we progress,
// we use a StatefulWidget (so we can update the screen when needed).
class QuizWidget extends StatefulWidget {
  const QuizWidget({super.key});

  @override
  State<QuizWidget> createState() {
    return _QuizWidgetState();
  }
}

class _QuizWidgetState extends State<QuizWidget> {
  // Keeps track of which screen should be visible (start, questions, or results)
  var activeScreen = 'start-screen';

  // Stores all the answers chosen by the user
  List<String> selectedAnswers = [];

  // Called when the user taps the "Start Quiz" button.
  // It resets previous answers and moves to the questions screen.
  void switchScreen() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  // Called whenever the user selects an answer.
  // Once all questions are answered, it switches to the results screen.
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  // Builds the UI based on which screen is active
  @override
  Widget build(context) {
    // Default screen is the start screen with the image button
    Widget screenWidget = ImageButtonWidget(switchScreen);

    // If the quiz has started, show the questions screen
    if (activeScreen == "question-screen") {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    }

    // If the quiz is completed, show the results screen
    if (activeScreen == "results-screen") {
      screenWidget = ResultScreen(
        restartQuiz: switchScreen,
        chosenAnswers: selectedAnswers,
      );
    }

    // App structure: A MaterialApp with a Scaffold and gradient background
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.deepPurpleAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: screenWidget, // Display whichever screen is active
        ),
      ),
    );
  }
}
