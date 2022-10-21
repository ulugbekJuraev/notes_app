import 'package:hive_flutter/hive_flutter.dart';
import 'package:lesson_28_flutter/domain/hive/hive_keys.dart';
import 'package:lesson_28_flutter/domain/hive/note_data.dart';

abstract class HiveBoxes {
  static final Box<NoteData> notes = Hive.box(HiveKeys.notesKey);
}
