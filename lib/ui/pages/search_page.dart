import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lesson_28_flutter/domain/hive/hive_boxes.dart';
import 'package:lesson_28_flutter/domain/hive/note_data.dart';
import 'package:lesson_28_flutter/ui/components/appbar_shadow.dart/app_bar_shadow.dart';
import 'package:lesson_28_flutter/ui/components/noteListItem/note_list_item.dart';
import 'package:lesson_28_flutter/ui/theme/app_styles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _notes = HiveBoxes.notes.values.toList();
  TextEditingController searchController = TextEditingController();
  var filteredNotes = <NoteData>[];

  void searchNotes() {
    final query = searchController.text;
    if (query.isNotEmpty) {
      filteredNotes = _notes.where((NoteData noteList) {
        return noteList.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      filteredNotes = _notes;
    }

    if (query.isNotEmpty) {
      filteredNotes = _notes.where((NoteData noteList) {
        return noteList.description.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    setState(() {});
  }

  @override
  void initState() {
    filteredNotes = _notes;
    searchController.addListener(() {
      searchNotes();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                if (searchController.text.isNotEmpty) {
                } else {
                  Navigator.of(context).pop();
                }
              },
              splashColor: Colors.transparent,
              iconSize: 24,
              splashRadius: 24,
            ),
        
        
        
        
          ],
          flexibleSpace: AppBarShadow(),
          title: TextField(
            controller: searchController,
            style: AppStyles.appBarStyle,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              hintText: 'Поиск...',
              hintStyle: AppStyles.appBarStyle,
            ),
          ),
    
    
    
    
        ),
        body: ValueListenableBuilder(
          valueListenable: HiveBoxes.notes.listenable(),
          builder: (context, Box<NoteData> box, child) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final note = filteredNotes[index];
                return NoteListItem(
                  index: index,
                  note: note.description,
                  noteDate: note.date,
                  noteTitle: note.title,
                );
              },
              separatorBuilder: ((context, index) => const SizedBox(
                    height: 10,
                  )),
              itemCount: filteredNotes.length,
            );
          },
        ));
  }
}
