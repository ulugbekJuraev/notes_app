
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_styles.dart';

class BottomContentBtn extends StatelessWidget {
  final IconData icon;
  final String str;
  final Function btnAction;
  const BottomContentBtn({
    Key? key,
    required this.icon,
    required this.str,
    required this.btnAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: TextButton.icon(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
        ),
        onPressed: () => btnAction(),
        icon: Icon(
          icon,
          size: 24,
          color: AppColors.primerySecondaryColor,
        ),
        label: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              str,
              style: AppStyles.noteTtile.copyWith(
                height: 1.37,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
