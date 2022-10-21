import 'package:flutter/cupertino.dart';
import 'package:lesson_28_flutter/domain/hive/hive_boxes.dart';
import 'package:lesson_28_flutter/domain/hive/note_data.dart';

class NoteProvider extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  void addNote() async {
    await HiveBoxes.notes.add(
      NoteData(
        title: titleController.text == '' ? 'Нет Данных' : titleController.text,
        description:
            noteController.text == '' ? 'Нет Данных' : noteController.text,
      ),
    );
    clearControllres();
    notifyListeners();
  }

  void deleteNote(int index, BuildContext context) {
    HiveBoxes.notes.deleteAt(index);
    Navigator.of(context).pop();
    notifyListeners();
  }

  void changeNoteData(int index, BuildContext context) {
    HiveBoxes.notes.putAt(
      index,
      NoteData(
        title: titleController.text,
        description: noteController.text,
      ),
    );
    Navigator.of(context).pop();
    clearControllres();
    notifyListeners();
  }

  void setController({int? index}){
    if (index == null) {
      clearControllres();
    }else{
      titleController.text = HiveBoxes.notes.getAt(index)?.title ?? '';
      noteController.text =  HiveBoxes.notes.getAt(index)?.description ?? '';
    }
  }

  void clearControllres() {
    titleController.clear();
    noteController.clear();
  }
}
