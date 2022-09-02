import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lang_practise/app_localization.dart';
import 'package:lang_practise/home_page.dart';
import 'package:lang_practise/lang_bloc/language_bloc.dart';

void main() {
  runApp(BlocProvider<LanguageBloc>(
    create: (context) => LanguageBloc(LanguageInitial.initial()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageInitial>(
        builder: (context, state) {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        locale: state.locale,
        localizationsDelegates: const [
          AppLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('te', ''),
          Locale('ta', ''),
        ],
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      );
    });
  }
}
