import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageInitial> {
  LanguageInitial get initialState => LanguageInitial.initial();
  LanguageBloc(LanguageInitial initialState) : super(initialState) {
    on<LoadLanguage>((event, emit) {
      emit(LanguageInitial(locale: event.locale));
    });
  }
}
