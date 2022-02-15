import 'package:flutter/material.dart';

class ResultManager extends ChangeNotifier {
  String suggestion = '';

  void passSuggestion(newSuggestion) {
    suggestion = newSuggestion;
    notifyListeners();
  }
}
