import 'package:bloc/bloc.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:meta/meta.dart';
import 'package:notes/constants.dart';
import 'package:notes/models/notes_model.dart';

part 'edit_state.dart';

class EditCubit extends Cubit<EditState> {
  EditCubit() : super(EditInitial());

  editNotes(int index, NotesModel value) async {
    var notesbox = Hive.box<NotesModel>(kNotesBox);
    await notesbox.putAt(index, value);
    emit(EditNotesSuccess());
  }
}
