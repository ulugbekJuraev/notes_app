import 'package:flutter/material.dart';
import 'package:lesson_28_flutter/domain/provider/note_provider.dart';
import 'package:provider/provider.dart';

import '../components/appbar_shadow.dart/app_bar_shadow.dart';
import '../theme/app_colors.dart';
import '../theme/app_styles.dart';

class ChangePage extends StatelessWidget {
  const ChangePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NoteProvider>();
    final index = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: const AppBarShadow(),
        title: Text(
          'Изменить заметку',
          style: AppStyles.appBarStyle,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          NoteAppInput(
            text: 'Заголовок',
            controller: model.titleController,
          ),
          const SizedBox(height: 16),
          NoteAppInput(
            text: 'Заметка',
            controller: model.noteController,
          ),
          const SizedBox(height: 16),
          TextBtn(
            str: 'Изменить',
            func: () {
              if (index is int) {
                model.changeNoteData(index, context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('No Data'),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class NoteAppInput extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  const NoteAppInput({
    Key? key,
    required this.text,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 90, 85, 85),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 90, 85, 85),
          ),
        ),
        hintText: text,
        hintStyle: AppStyles.noteTtile,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 90, 85, 85),
          ),
        ),
        labelText: text,
        labelStyle: AppStyles.noteTtile.copyWith(
          fontWeight: FontWeight.w400,
          height: 1.5,
          color: AppColors.primerySecondaryColor,
          backgroundColor: AppColors.primeryBgColor,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}

class TextBtn extends StatelessWidget {
  final Function func;
  final String str;
  const TextBtn({
    Key? key,
    required this.func,
    required this.str,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => func(),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(2),
        shadowColor: MaterialStateProperty.all(
          const Color.fromARGB(0, 0, 0, 03),
        ),
        backgroundColor: MaterialStateProperty.all(
          AppColors.primeryBgColor,
        ),
      ),
      child: Text(
        str,
        style: const TextStyle(
          color: AppColors.btnTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1.42,
        ),
      ),
    );
  }
}
