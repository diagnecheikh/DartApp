import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TextEditingController valeurTextFiledController = TextEditingController();
  TextEditingController mycontroller;

  get suffixIcon => null;

  @override
  void initState() {
    mycontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    mycontroller.dispose();
    super.dispose();
  }

  final pokemons = <Pokemon>[
    Pokemon('Pikachu', Icons.ac_unit),
    Pokemon('Bulbizarre', Icons.wb_sunny),
    Pokemon('Salamèche', Icons.whatshot),
    Pokemon('Carapuce', Icons.remove_red_eye),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hola Mundo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 50),
                Expanded(
                  child: TextField(
                    controller: mycontroller,
                    decoration: InputDecoration(
                      labelText: 'Ecriver un nom',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    final String nameToAdd = mycontroller.text;
                    if (nameToAdd.length < 3) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Le nom doit contenir au moins 3 caractères'),
                        ),
                      );
                      return;
                    }
                    // LE MOT NE DOIT PAS ETRE DANS LA LISTE
                    setState(() {
                      pokemons.add(
                        Pokemon(
                          nameToAdd,
                          Icons.star,
                        ),
                      );
                      mycontroller.clear();
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            for (final Pokemon item in pokemons)
              TheAmazingRow(
                label: item.name,
                icon: item.illustration,
                onDeleted: onPokemonDeleted,
              ),
          ],
        ),
      ),
    );
  }

  void onPokemonDeleted(String name) {
    pokemons.removeWhere((element) => element.name == name);
    setState(() {});
  }
}

class Pokemon {
  const Pokemon(
    this.name,
    this.illustration,
  );
  final String name;
  final IconData illustration;
}

class TheAmazingRow extends StatelessWidget {
  const TheAmazingRow({
    key,
    this.icon,
    this.label,
    this.onDeleted,
  }) : super(key: key);
  final IconData icon;
  final String label;
  final Function(String) onDeleted;

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
            onPressed: () => onDeleted(label),
          ),
        ],
      ),
    );
  }
}
