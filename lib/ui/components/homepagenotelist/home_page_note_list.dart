import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:lesson_28_flutter/domain/hive/hive_boxes.dart';
import 'package:lesson_28_flutter/ui/theme/app_styles.dart';

import '../../../domain/hive/note_data.dart';
import '../noteListItem/note_list_item.dart';

class HomePageNoteList extends StatelessWidget {
  const HomePageNoteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: HiveBoxes.notes.listenable(),
        builder: (
          BuildContext context,
          Box<NoteData> box,
          child,
        ) {
         
          final noteList = box.values.toList();
          return HiveBoxes.notes.length > 0
              ? ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) => NoteListItem(
                    index: index,
                    note:  noteList[index].description ,
                    noteDate: '07.03.2022',
                    noteTitle: noteList[index].title,
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemCount: noteList.length,
                )
              : Center(
                  child: Text(
                    'No Data',
                    style: AppStyles.appBarStyle,
                  ),
                );
        });
  }
}
