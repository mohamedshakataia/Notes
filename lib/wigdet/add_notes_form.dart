import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes/cubits/add_notes_cubit/add_notes_state.dart';
import 'package:notes/models/notes_model.dart';
import 'package:notes/wigdet/color_items.dart';
import 'package:notes/wigdet/color_list_view.dart';
import 'package:notes/wigdet/custom_button.dart';
import 'package:notes/wigdet/custom_text_field.dart';

class AddNotesForm extends StatefulWidget {
  const AddNotesForm({super.key});
  @override
  State<AddNotesForm> createState() => _AddNotesFormState();
}

class _AddNotesFormState extends State<AddNotesForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode validator = AutovalidateMode.disabled;
  String? title;
  String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTextField(
              onsaved: (value) {
                title = value;
              },
              hint: 'title',
            ),
            SizedBox(height: 10),
            CustomTextField(
              onsaved: (value) {
                subtitle = value;
              },
              hint: 'Content',
              maxlines: 5,
            ),
            SizedBox(height: 30),
            ColorListView(),

            SizedBox(height: 20),

            BlocBuilder<AddNotesCubit, AddNotesState>(
              builder: (context, state) {
                return CustomButton(
                  isloading: state is AddNotesLoadingState ? true : false,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      DateTime now = DateTime.now();

                      String DateNow = DateFormat('MMM d, yyyy').format(now);
                      var notesmodel = NotesModel(
                        title: title!,
                        subtitle: subtitle!,
                        date: DateNow,
                        color: Colors.orange.toARGB32(),
                      );
                      BlocProvider.of<AddNotesCubit>(
                        context,
                      ).addNotes(notesmodel);
                    } else {
                      validator = AutovalidateMode.always;
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
