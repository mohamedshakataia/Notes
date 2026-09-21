import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes/cubits/delete_notes_cubit/delete_cubit.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/models/edit_model.dart';
import 'package:notes/models/notes_model.dart';
import 'package:notes/views/Edit_notes_view.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.note, required this.index});
  final NotesModel note;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            EditNotesView.id,
            arguments: EditModel(notes: note, index: index),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(note.color),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 20),
                  child: Text(
                    note.title,
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                ),
                subtitle: Text(
                  note.subtitle,
                  style: TextStyle(color: Colors.black.withAlpha(130)),
                ),
                trailing: IconButton(
                  onPressed: () {
                    BlocProvider.of<DeleteCubit>(context).deleteNotes(index!);
                    BlocProvider.of<NotesCubit>(context).fatchNotes();
                  },
                  icon: FaIcon(FontAwesomeIcons.trash, color: Colors.black),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 20, top: 20),
                child: Text(
                  note.date,
                  style: TextStyle(color: Colors.black.withAlpha(130)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
