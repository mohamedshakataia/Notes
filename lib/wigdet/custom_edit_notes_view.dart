import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/edit_notes_cubit/edit_cubit.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/models/notes_model.dart';
import 'package:notes/wigdet/Edit_color_list_view.dart';
import 'package:notes/wigdet/color_list_view.dart';

import 'package:notes/wigdet/custom_app_bar.dart';
import 'package:notes/wigdet/custom_text_field.dart';

class CustomEditNotesView extends StatefulWidget {
  const CustomEditNotesView({
    super.key,
    required this.notes,
    required this.index,
  });
  final NotesModel notes;
  final int index;

  @override
  State<CustomEditNotesView> createState() => _CustomEditNotesViewState();
}

class _CustomEditNotesViewState extends State<CustomEditNotesView> {
  String? title;
  String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          onpressed: () {
            widget.notes.title = title ?? widget.notes.title;
            widget.notes.subtitle = subtitle ?? widget.notes.subtitle;
            BlocProvider.of<EditCubit>(
              context,
            ).editNotes(widget.index, widget.notes);
            BlocProvider.of<NotesCubit>(context).fatchNotes();
            Navigator.pop(context);
          },

          titlebar: 'Edit Notes',
          icon: Icons.check,
        ),
        SizedBox(height: 40),
        CustomTextField(
          onchanged: (value) {
            title = value;
          },
          hint: widget.notes.title,
        ),
        SizedBox(height: 20),
        CustomTextField(
          onchanged: (value) {
            subtitle = value;
          },
          hint: widget.notes.subtitle,
          maxlines: 5,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: EditColorListView(note: widget.notes),
        ),
      ],
    );
  }
}
