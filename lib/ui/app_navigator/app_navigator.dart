import 'package:flutter/material.dart';
import 'package:lesson_28_flutter/ui/app_navigator/app_routes.dart';
import 'package:lesson_28_flutter/ui/pages/change_page.dart';
import 'package:lesson_28_flutter/ui/pages/control_page.dart';
import 'package:lesson_28_flutter/ui/pages/home_page.dart';
import 'package:lesson_28_flutter/ui/pages/search_page.dart';



class AppNavigator {
  static String get initialRoute => AppRoutes.homePage;

  static Map<String, WidgetBuilder> get routes => {
        AppRoutes.homePage: (context) => const HomePage(),
        AppRoutes.searchPage: (context) => const SearchPage(),
        AppRoutes.changePage: (context) => const ChangePage(),
        AppRoutes.controlPage: (context) => const ControlPage(),
      };
}
