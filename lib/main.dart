import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lesson_28_flutter/domain/hive/hive_keys.dart';
import 'package:lesson_28_flutter/ui/app.dart';

import 'domain/hive/note_data.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(NoteDataAdapter());
  await Hive.openBox<NoteData>(HiveKeys.notesKey);
  runApp(
    const NoteApp(),
  );
}
