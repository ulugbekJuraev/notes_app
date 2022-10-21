import 'package:flutter/cupertino.dart';
import 'package:lesson_28_flutter/ui/theme/app_colors.dart';

class AppStyles {
  static TextStyle appBarStyle = const TextStyle(
    fontSize: 22,
    height: 1.27,
    color: AppColors.primeryDarkColor,
  );

  static TextStyle noteTtile = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.18,
    color: AppColors.primeryDarkColor,
  );

  static TextStyle noteDate = const TextStyle(
    fontSize: 14,
    height: 1.42,
    color: AppColors.dateColor,
  );

  static TextStyle noteStyle = const TextStyle(
    fontSize: 14,
    height: 1.14,
    color: AppColors.primerySecondaryColor,
  );
}
