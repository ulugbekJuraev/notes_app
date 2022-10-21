import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lesson_28_flutter/domain/provider/note_provider.dart';
import 'package:lesson_28_flutter/ui/app_navigator/app_navigator.dart';
import 'package:lesson_28_flutter/ui/components/constants.dart';
import 'package:lesson_28_flutter/ui/theme/app_colors.dart';
import 'package:provider/provider.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteProvider(),
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.primeryBgColor,
          systemNavigationBarColor: AppColors.primeryBgColor,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Constant.color,
              ),
              backgroundColor: Constant.color,
              toolbarHeight: 64,
            ),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: AppNavigator.initialRoute,
          routes: AppNavigator.routes,
        ),
      ),
    );
  }
}
