# Quiz App

A simple Flutter quiz application for practicing multiple-choice questions.

## Features

- Start screen with logo and "Start Quiz" button
- Multiple-choice questions with shuffled answers
- Tracks user answers and shows results at the end
- Displays a summary of all questions, correct answers, and user selections
- Option to restart the quiz

## Getting Started

1. **Clone the repository:**
   ```
   git clone https://github.com/benjoy891/quiz_app.git
   cd quiz_app
   ```

2. **Install dependencies:**
   ```
   flutter pub get
   ```

3. **Run the app:**
   ```
   flutter run
   ```

## Folder Structure

- `lib/`
  - `main.dart` – Entry point of the app
  - `image_button.dart` – Start screen widget
  - `quiz.dart` – Main quiz logic and screen switching
  - `questions_screen.dart` – Displays questions and answer buttons
  - `answer_button.dart` – Custom button for answers
  - `result_screen.dart` – Shows results and summary
  - `questions_summary.dart` – Widget for displaying question summaries
  - `models/quiz_questions.dart` – Model for quiz questions
  - `data/questions.dart` – List of quiz questions

## Customization

- Add or edit questions in `lib/data/questions.dart`.
- Change images in `assets/images/`.
- Update styles and colors in widget files.

