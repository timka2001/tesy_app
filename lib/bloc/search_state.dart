import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SearchState {
  final String text1;
  final String text2;

  SearchState({required this.text1, required this.text2});

  factory SearchState.initial() {
    return SearchState(text1: '', text2: '');
  }

  SearchState copyWith({String? text1, String? text2}) {
    return SearchState(text1: text1 ?? this.text1, text2: text2 ?? this.text2);
  }
}
