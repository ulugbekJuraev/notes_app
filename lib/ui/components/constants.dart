import 'package:flutter/material.dart';

class Constant {
  // final String title;
  // final String date;
  // final String description;

  // const Constant(
  //     {Key? key,
  //     required this.title,
  //     required this.date,
  //     required this.description});

  static const Color color = Color(0xFFF7F2F9);

  static PreferredSize prefferedSize = PreferredSize(
    preferredSize: const Size.fromHeight(64),
    child: Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(78, 0, 0, 0),
            offset: Offset(1, 2),
            blurRadius: 2.0,
          )
        ],
      ),
      child: AppBar(
        actions: const [
          Icon(
            Icons.search,
            color: Color(0xFF49454F),
            size: 24,
          ),
          SizedBox(width: 20),
        ],
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Заметки',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22,
            height: 0.78,
            color: Color(0xFF1C1B1F),
            fontFamily: "Roboto",
          ),
        ),
      ),
    ),
  );

  static const TextStyle titleStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 0.84,
    color: Color(0xFF1C1B1F),
    fontFamily: "Roboto",
  );

  static const TextStyle dateStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 0.7,
    color: Color(0xFFCAC4D0),
    fontFamily: "Roboto",
  );

  static const TextStyle descriptionStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 0.85,
    color: Color(0xFF49454F),
    fontFamily: "Roboto",
  );

  static const BoxDecoration mainContainerDecoration = BoxDecoration(
    color: Color(0xFFF7F2F9),
    borderRadius: BorderRadius.all(
      Radius.circular(16),
    ),
    boxShadow: [
      BoxShadow(
        color: Color.fromARGB(78, 0, 0, 0),
        offset: Offset(1, 2),
        blurRadius: 1.0,
      )
    ],
  );
}

class MyTtileText extends StatelessWidget {
  final String title;
  // final String date;
  // final String description;

  const MyTtileText({
    Key? key,
    required this.title,
    // required this.date,
    // required this.description
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title, style: Constant.titleStyle);
  }
}

class MyDateText extends StatelessWidget {
  final String date;

  const MyDateText({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(date, style: Constant.dateStyle);
  }
}

class MyDescriptionText extends StatelessWidget {
  final String description;

  const MyDescriptionText({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(description, style: Constant.descriptionStyle);
  }
}
