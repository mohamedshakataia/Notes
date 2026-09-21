class AddNotesState {}

class AddNotesInitial extends AddNotesState {}

class AddNotesLoadingState extends AddNotesState {}

class AddNotesSuccessState extends AddNotesState {}

class AddNotesFailureState extends AddNotesState {
  final String errorMessage;

  AddNotesFailureState(this.errorMessage);
}
