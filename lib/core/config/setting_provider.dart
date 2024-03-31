import 'package:flutter/cupertino.dart';

class settingProvider extends ChangeNotifier {
  String currentLanguage = "en";

  changeLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    notifyListeners();
  }
}
