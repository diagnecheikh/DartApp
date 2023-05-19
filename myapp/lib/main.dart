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

class Pokemon {
  const Pokemon(
    this.name,
    this.icon,
  );
  final String name;
  final IconData icon;
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  final List<Pokemon> pokemons = const [
    Pokemon('Pikachu', Icons.ac_unit),
    Pokemon('Bulbizarre', Icons.wb_sunny),
    Pokemon('Salamèche', Icons.whatshot),
    Pokemon('Carapuce', Icons.remove_red_eye),
  ];

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
              Icons.cloud,
              "Hello world",
            ),
            SizedBox(height: 16),
            TheAmazingRow(
              Icons.wb_sunny,
              "Hola desde un mundo lejano",
            ),
            SizedBox(height: 16),
            TheAmazingRow(
              Icons.line_weight,
              "Hallo aus einer fernen Welt",
            ),
          ],
        ),
      ),
    );
  }
}

class TheAmazingRow extends StatelessWidget {
  const TheAmazingRow(
    this.icon,
    this.label,
  );
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
          Icon(icon),
          const SizedBox(width: 18),
          Expanded(child: Text(label)),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => print('Hallo Welt'),
          ),
        ],
      ),
    );
  }
}
