import "package:flutter/material.dart";

// This widget displays the start screen with an image, text, and a "Start Quiz" button.
class ImageButtonWidget extends StatelessWidget {
  // Constructor: Takes a function (startQuiz) that will be called when the button is pressed.
  const ImageButtonWidget(this.startQuiz, {super.key});

  // Function to start the quiz (passed from the parent widget)
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      // Center places the content in the middle of the screen
      child: Column(
        mainAxisSize: MainAxisSize
            .min, // Makes the column only as tall as its content (not full screen)
        children: [
          // App logo with a slight white transparency
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(
              133,
              255,
              255,
              255,
            ), // Makes it semi-transparent
          ),

          SizedBox(height: 30), // Adds space below the image
          // A simple title for the quiz
          Text(
            "A Quiz App for practice",
            style: TextStyle(
              color: const Color.fromARGB(255, 203, 203, 203),
              fontSize: 25,
            ),
          ),

          SizedBox(height: 20), // Adds space between text and button
          // Button with an icon and label to start the quiz
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded button edges
              ),
              backgroundColor: Colors.deepPurple, // Button background color
              foregroundColor:
                  Colors.deepPurpleAccent, // Button text/icon default color
            ),
            onPressed: startQuiz, // Calls the startQuiz function when pressed
            icon: Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ), // Button icon
            label: const Text(
              "Start Quiz",
              style: TextStyle(color: Colors.white), // Button text
            ),
          ),
        ],
      ),
    );
  }
}
