import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/widgets/the_amazing_row.dart';

import 'entities/detail_page.dart';
import 'entities/pokemon.dart';

void main() => runApp(
      MyApp(),
    );

class PageName {
  static const String homePage = '/';
  static const String detailPage = '/detailPage';
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // <== définit le thème Light
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        // <== définit le thème Dark
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark, // <== on choisit le Dark
      initialRoute: PageName.homePage,
      routes: {
        PageName.homePage: (context) => const HomePage(),
        PageName.detailPage: (context) => const DetailPage(),
      },
    );
  }
}
