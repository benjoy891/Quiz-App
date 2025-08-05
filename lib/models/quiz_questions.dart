// This class represents a single quiz question
class QuizQuestions {
  // Constructor: takes the question text and a list of answers
  const QuizQuestions(this.text, this.answers);

  // The actual question text (e.g., "What is Flutter?")
  final String text;

  // A list of possible answers (first one is usually the correct answer)
  final List<String> answers;

  // Returns a new list of answers in random order
  List<String> getShuffledList() {
    final shuffledList = List.of(answers); // Make a copy of the answers
    shuffledList.shuffle(); // Shuffle the answers randomly
    return shuffledList; // Return the shuffled list
  }
}
