import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes/cubits/add_notes_cubit/add_notes_state.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/helper/showsnackbar.dart';

import 'package:notes/wigdet/add_notes_form.dart';

class AddNotesBottomSheet extends StatelessWidget {
  const AddNotesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNotesCubit, AddNotesState>(
      listener: (context, state) {
        if (state is AddNotesSuccessState) {
          BlocProvider.of<NotesCubit>(context).fatchNotes();
          Navigator.pop(context);
          showSnackbar(context, 'Add Notes Success');
        }
        if (state is AddNotesFailureState) {
          showSnackbar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is AddNotesLoadingState ? true : false,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(child: AddNotesForm()),
          ),
        );
      },
    );
  }
}
