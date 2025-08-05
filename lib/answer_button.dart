import "package:flutter/material.dart";

// A custom button widget for showing an answer option
class AnswerButton extends StatelessWidget {
  // Constructor with named arguments:
  // answerText → The text shown on the button
  // onTap → The function to run when the button is pressed
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  // The text that will appear on the button
  final String answerText;

  // The function to call when the button is tapped
  final void Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
      // When the button is pressed, call the onTap function
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ), // Button size and spacing
        backgroundColor: const Color.fromARGB(
          255,
          255,
          255,
          255,
        ), // White background
        foregroundColor: const Color.fromARGB(255, 0, 0, 0), // Black text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center, // Center the text inside the button
      ),
    );
  }
}
