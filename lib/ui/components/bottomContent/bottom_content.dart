import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/provider/note_provider.dart';
import '../../app_navigator/app_routes.dart';
import '../../theme/app_styles.dart';
import '../alertDialogDelete/alert_dialog_delete.dart';
import '../bottomContentBtn/bottom_content_btn.dart';

class BottomContent extends StatelessWidget {
  final String title, note;
  final int index;

  const BottomContent(
      {Key? key, required this.index, this.note = '', this.title = ','})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NoteProvider>();
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 34,
          height: 4,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(19)),
            color: Color.fromARGB(255, 84, 74, 74),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: AppStyles.noteTtile,
        ),
        const SizedBox(height: 10),
        Text(
          note,
          maxLines: 1,
          style: AppStyles.noteStyle.copyWith(
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Spacer(),
        BottomContentBtn(
          icon: Icons.edit,
          str: 'Редактировать',
          btnAction: () {
            Navigator.of(context).pushNamed(
              AppRoutes.changePage,
              arguments: index,
            );
            model.setController(index: index);
          },
        ),
        BottomContentBtn(
          icon: Icons.backspace,
          str: 'Удалить',
          btnAction: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialogDelete(
                title: title,
                note: note,
                index: index,
              ),
            );
           
          },
        ),
      ],
    );
  }
}
