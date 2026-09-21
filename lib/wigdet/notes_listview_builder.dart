import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/models/notes_model.dart';
import 'package:notes/wigdet/custom_card.dart';

class NotesListviewBuilder extends StatelessWidget {
  const NotesListviewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          List<NotesModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
          return ListView.builder(
            itemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return CustomCard(note: notes[index], index: index);
            },
          );
        },
      ),
    );
  }
}
