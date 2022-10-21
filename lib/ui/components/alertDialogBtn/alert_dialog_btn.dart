import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class AlertDialogBtn extends StatelessWidget {
  final String text;
  final Function func;
  const AlertDialogBtn({
    Key? key,
    this.text = "Удалить",
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(
            const Size(75, 40),
          ),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))))),
      onPressed: () => func(),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.btnTextColor,
          height: 1.42,
        ),
      ),
    );
  }
}

