part of 'language_bloc.dart';

class LanguageInitial extends Equatable {
  final Locale locale;

  const LanguageInitial({required this.locale});

  factory LanguageInitial.initial() =>
      const LanguageInitial(locale: Locale('en', ''));

  LanguageInitial copyWith({required Locale locale}) =>
      LanguageInitial(locale: locale);

  @override
  List<Object> get props => [locale];
}