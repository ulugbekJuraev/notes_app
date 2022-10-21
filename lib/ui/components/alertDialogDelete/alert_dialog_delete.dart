import 'package:flutter/material.dart';
import 'package:lesson_28_flutter/domain/provider/note_provider.dart';
import 'package:provider/provider.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_styles.dart';
import '../alertDialogBtn/alert_dialog_btn.dart';


class AlertDialogDelete extends StatelessWidget {
  const AlertDialogDelete({
    Key? key,
    required this.title,
    required this.note,
    required this.index,
  }) : super(key: key);

  final String title;
  final String note;
  final int index;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NoteProvider>();
    return AlertDialog(
      backgroundColor: AppColors.primeryBgColor,
      title: const Text('Удалить'),
      contentPadding: const EdgeInsets.all(24),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Удалить заметку $title',
            maxLines: 1,
            style: AppStyles.noteTtile,
          ),
          const SizedBox(height: 16),
          Text(
            'Заметка: $note',
            maxLines: 2,
            style: AppStyles.noteStyle,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <AlertDialogBtn>[
              AlertDialogBtn(
                func: () {
                  Navigator.of(context).pop();
                },
                text: 'Отмена',
              ),
              AlertDialogBtn(
                func: () {
                  model.deleteNote(index, context);
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Color.fromARGB(255, 49, 97, 39),
                      // width: 200,
                      content: Text(
                        'Заметка удалена',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  );
                },
                text: 'Удалить',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
