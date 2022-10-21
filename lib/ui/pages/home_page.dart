import 'package:flutter/material.dart';
import 'package:lesson_28_flutter/ui/app_navigator/app_routes.dart';

import 'package:lesson_28_flutter/ui/components/appbar_shadow.dart/app_bar_shadow.dart';
import 'package:lesson_28_flutter/ui/components/homePageAddBtn/homr_page_add_btn.dart';
import 'package:lesson_28_flutter/ui/components/homepagenotelist/home_page_note_list.dart';
import 'package:lesson_28_flutter/ui/theme/app_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const HomePageAddPtn(),
      appBar: AppBar(
        title: Text(
          'Заметки',
          style: AppStyles.appBarStyle,
        ),
        centerTitle: true,
        flexibleSpace: const AppBarShadow(),
        actions: [
          IconButton(
            onPressed: () {
             Navigator.of(context).pushNamed(AppRoutes.searchPage);
            },
            icon: const Icon(Icons.search),
            iconSize: 24,
            splashRadius: 24,
          ),
        ],
      ),
      body: const HomePageNoteList(),
    );
  }
}

