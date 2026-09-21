import 'package:flutter/material.dart';
import 'package:notes/models/edit_model.dart';
import 'package:notes/models/notes_model.dart';
import 'package:notes/wigdet/color_list_view.dart';
import 'package:notes/wigdet/custom_edit_notes_view.dart';

class EditNotesView extends StatelessWidget {
  const EditNotesView({super.key});
  static String id = 'EditNotesView';

  @override
  Widget build(BuildContext context) {
    EditModel note = ModalRoute.of(context)!.settings.arguments as EditModel;
    EditModel index = ModalRoute.of(context)!.settings.arguments as EditModel;

    NotesModel notes = note.notes;
    int indexx = note.index;

    return Scaffold(
      body: CustomEditNotesView(notes: notes, index: indexx),
    );
  }
}
