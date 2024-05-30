abstract class SearchEvent {}

class InitialSearchEvent extends SearchEvent {}

class OnChangeFirstSearchEvent extends SearchEvent {
  final String text;
  OnChangeFirstSearchEvent({required this.text});
}

class OnClearSecondSearchEvent extends SearchEvent {}

class OnSwapSerchEvent extends SearchEvent {}

class OnChangeSecondSearchEvent extends SearchEvent {
  final String text;
  OnChangeSecondSearchEvent({required this.text});
}

class OnButtomPressEvent extends SearchEvent {}
