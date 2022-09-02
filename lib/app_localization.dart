import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {

  final Locale locale;


  AppLocalization(this.locale);

  static AppLocalization of(BuildContext context) {
    return Localizations.of(context, AppLocalization);
  }

  late Map<String, dynamic> _localizedValues;

  Future loadLangJson() async {
    String jsonString = await rootBundle.loadString('assets/languages/${locale.languageCode}.json');

    Map<String, dynamic> jsonMap = jsonDecode(jsonString);

    _localizedValues = jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  String localText(String key) {
    return _localizedValues[key];
  }

  static const LocalizationsDelegate<AppLocalization> delegate = _AppLocalizationDelegate();

}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization>{
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'te', 'ta'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localization = AppLocalization(locale);
    await localization.loadLangJson();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) {
    return false;
  }

}