import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesy_app/bloc/search_event.dart';
import 'package:tesy_app/bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(InitialSearchEvent initialSearchEvent)
      : super(SearchState.initial()) {
    on<OnChangeFirstSearchEvent>((event, emit) {
      emit(state.copyWith(text1: event.text));
    });

    on<OnClearSecondSearchEvent>((event, emit) {
      emit(state.copyWith(text2: ''));
    });
    on<OnSwapSerchEvent>((event, emit) {
      final text = state.text1;
      emit(state.copyWith(text1: state.text2, text2: text));
    });
    on<OnChangeSecondSearchEvent>((event, emit) {
      emit(state.copyWith(text2: event.text));
    });
    on<OnButtomPressEvent>((event, emit) {
      emit(state.copyWith(text2: 'Куда Угодно'));
    });
  }
}
