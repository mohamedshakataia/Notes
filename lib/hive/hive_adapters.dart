import 'package:hive_ce/hive_ce.dart';
import 'package:notes/models/notes_model.dart';

@GenerateAdapters([AdapterSpec<NotesModel>()])
part 'hive_adapters.g.dart';
