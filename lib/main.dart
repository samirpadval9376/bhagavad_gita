import 'package:flutter/material.dart';
import 'package:json_app/controllers/json_controller.dart';
import 'package:json_app/utils/my_page_route.dart';
import 'package:json_app/views/screens/chapter_page.dart';
import 'package:json_app/views/screens/detail_page.dart';
import 'package:json_app/views/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => JsonController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      routes: {
        MyPageRoute.home: (context) => HomePage(),
        MyPageRoute.chapterPage: (context) => ChapterPage(),
        MyPageRoute.detailPage: (context) => DetailsPage(),
      },
    );
  }
}
