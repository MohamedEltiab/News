import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../main.dart';

class Constant {
  static var lang = AppLocalizations.of(navigatorKey.currentState!.context);
  static var theme = Theme.of(navigatorKey.currentState!.context);
  static var mediaQuery = MediaQuery.of(navigatorKey.currentState!.context);

  static const String apiKey = "9fe2f88044bc47febc8fc235a51db1c5";
  static const String baseURL = "newsapi.org";

//static const String baseURL = "/v2/top-headlines/sources";
}
