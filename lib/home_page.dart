import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lang_practise/app_localization.dart';
import 'package:lang_practise/lang_bloc/language_bloc.dart';
import 'package:lang_practise/utils/enums.dart';
import 'package:lang_practise/utils/labels.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 160.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalization.of(context).localText(Labels.QUOTE_2)),
                  Text(AppLocalization.of(context).localText(Labels.QUOTE_1)),
                  Text(AppLocalization.of(context).localText(Labels.QUOTE_3)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  LanguageContainer(
                    onTap: () {
                      BlocProvider.of<LanguageBloc>(context).add(LoadLanguage(
                          locale: Locale('en', '')));
                    },
                    color1: Colors.cyan,
                    color2: Colors.cyanAccent,
                    languageText: 'English',
                  ),
                  LanguageContainer(
                    onTap: () {
                      BlocProvider.of<LanguageBloc>(context)
                          .add(LoadLanguage(locale: const Locale('te', '')));
                    },
                    // onTap: _changeLanguage('te'),
                    color1: Colors.indigo,
                    color2: Colors.indigoAccent,
                    languageText: 'Telugu',
                  ),
                  LanguageContainer(
                    onTap: () {
                      BlocProvider.of<LanguageBloc>(context)
                          .add(LoadLanguage(locale: const Locale('ta', '')));
                    },
                    color1: Colors.green,
                    color2: Colors.greenAccent,
                    languageText: 'Tamil',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getLanguage(SupportedLanguages lang) {
    switch (lang) {
      case SupportedLanguages.en:
        return 'en';
      case SupportedLanguages.te:
        return 'te';
      case SupportedLanguages.ta:
       return 'ta';
      default:
       return 'en';
    }
  }

  _changeLanguage(String loc) {
    BlocProvider.of<LanguageBloc>(context)
        .add(LoadLanguage(locale: Locale(loc, '')));
  }
}

class LanguageContainer extends StatelessWidget {
  final Color color1, color2;
  final String languageText;
  final VoidCallback onTap;

  const LanguageContainer(
      {Key? key,
      required this.color1,
      required this.languageText,
      required this.color2,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              gradient: LinearGradient(colors: [color1, color2])),
          height: 60.0,
          width: 90.0,
          alignment: Alignment.center,
          child: Text(languageText)),
    );
  }
}
