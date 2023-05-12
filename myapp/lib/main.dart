import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(
      MyApp(),
    );

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Première appli'),
      ),
      body: Center(
        child: Column(
          children: const [
            TheAmazingRow(
              icon: Icons.cloud,
              label: "Cheikh",
            ),
            SizedBox(height: 16),
            TheAmazingRow(),
            SizedBox(height: 16),
            TheAmazingRow(),
          ],
        ),
      ),
    );
  }
}

class TheAmazingRow extends StatelessWidget {
  const TheAmazingRow({
    Key key,
    this.icon,
    this.label,
  });
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 25,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Row(
        children: [
          const Icon(Icons.wb_sunny),
          const SizedBox(width: 18),
          Expanded(child: const Text('Hello World')),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => print('Hallo Welt'),
          ),
        ],
      ),
    );
  }
}
