import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:notes/constants.dart';

import 'package:notes/cubits/add_notes_cubit/add_notes_state.dart';
import 'package:notes/models/notes_model.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());
  Color? color = Color(0xffa31621);
  addNotes(NotesModel note) async {
    note.color = color!.toARGB32();
    emit(AddNotesLoadingState());
    try {
      var notesbox = Hive.box<NotesModel>(kNotesBox);
      await notesbox.add(note);
      emit(AddNotesSuccessState());
    } catch (e) {
      emit(AddNotesFailureState(e.toString()));
    }
  }
}
