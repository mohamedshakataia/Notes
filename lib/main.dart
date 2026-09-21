import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:notes/constants.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:notes/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes/cubits/edit_notes_cubit/edit_cubit.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/hive/hive_adapters.dart';
import 'package:notes/models/notes_model.dart';
import 'package:notes/observer/simple_osbserver.dart';
import 'package:notes/views/Edit_notes_view.dart';
import 'package:notes/views/note_view.dart';

void main() async {
  await initializeDateFormatting();
  await Hive.initFlutter();
  Bloc.observer = SimpleOsbserver();
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotesCubit()),
        BlocProvider(create: (context) => EditCubit()),
        BlocProvider(create: (context) => AddNotesCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins', brightness: Brightness.dark),

        routes: {
          NoteView.id: (context) => NoteView(),
          EditNotesView.id: (context) => EditNotesView(),
        },

        initialRoute: NoteView.id,
      ),
    );
  }
}
