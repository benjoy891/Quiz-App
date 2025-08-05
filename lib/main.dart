// Importing Flutter's material design package which gives us access to ready-made UI widgets like buttons, text, etc.
import "package:flutter/material.dart";

// Importing our custom 'quiz.dart' file where the main QuizWidget is defined
import "package:quiz_app/quiz.dart";

// The main() function is where the Flutter app starts running
void main() {
  // runApp() launches the Flutter app and displays the widget we pass to it
  // Here, we are starting our app with the QuizWidget (from quiz.dart)
  runApp(QuizWidget());
}
