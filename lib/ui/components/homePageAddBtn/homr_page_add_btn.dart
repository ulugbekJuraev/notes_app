import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_28_flutter/ui/app_navigator/app_routes.dart';
import 'package:lesson_28_flutter/ui/theme/app_colors.dart';

class HomePageAddPtn extends StatelessWidget {
  const HomePageAddPtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed(AppRoutes.controlPage);
      },
      backgroundColor: AppColors.primeryBgColor,
      elevation: 3,
      child: SvgPicture.asset('assets/icon.svg'),
    );
  }
}
