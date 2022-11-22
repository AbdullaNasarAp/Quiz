import 'package:flutter/cupertino.dart';

class QuizProvider with ChangeNotifier {
  int currentIndex = 0;
  nextQuestion() {
    currentIndex++;
    notifyListeners();
  }
}
