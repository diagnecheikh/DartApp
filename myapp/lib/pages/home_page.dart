import 'package:flutter/material.dart';
import 'package:myapp/entities/pokemon.dart';
import 'package:myapp/pages/widgets/the_amazing_row.dart';

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
