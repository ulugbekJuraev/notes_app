import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_styles.dart';
import '../bottomContent/bottom_content.dart';

class NoteListItem extends StatelessWidget {
  final String noteTitle, noteDate, note;
  final int index;
  const NoteListItem({
    Key? key,
    required this.index,
    required this.note,
    required this.noteDate,
    required this.noteTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            height: 179,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: BottomContent(
              index: index,
              title: noteTitle,
              note: note,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, .3),
              blurRadius: 2,
              spreadRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
          color: AppColors.primeryBgColor,
          borderRadius: BorderRadius.circular(16),
        ),
        constraints: const BoxConstraints(
          minHeight: 117,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              noteTitle,
              style: AppStyles.noteTtile,
            ),
            const SizedBox(height: 5),
            Text(
              noteDate,
              style: AppStyles.noteDate,
            ),
            const SizedBox(height: 9),
            Text(
              note,
              style: AppStyles.noteStyle,
            ),
          ],
        ),
      ),
    );
  }
}
