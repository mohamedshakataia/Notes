import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/constants.dart';
import 'package:notes/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes/cubits/delete_notes_cubit/delete_cubit.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';

import 'package:notes/views/notes_view_body.dart';
import 'package:notes/wigdet/add_notes_bottom_sheet.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});
  static String id = 'NoteView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: KColor,
          onPressed: () {},
          child: IconButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return AddNotesBottomSheet();
                },
              );
            },
            icon: const Icon(Icons.add, color: Colors.black),
          ),
        ),
        body: const NotesViewBody(),
      ),
    );
  }
}
