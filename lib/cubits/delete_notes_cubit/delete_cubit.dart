import 'package:bloc/bloc.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:meta/meta.dart';
import 'package:notes/constants.dart';
import 'package:notes/models/notes_model.dart';

part 'delete_state.dart';

class DeleteCubit extends Cubit<DeleteState> {
  DeleteCubit() : super(DeleteInitial());

  deleteNotes(int index) async {
    var notesbox = Hive.box<NotesModel>(kNotesBox);
    await notesbox.deleteAt(index);
    emit(DeleteNoteSuccess());
  }
}
