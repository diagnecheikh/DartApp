import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hola Mundo'),
        ),
        body: SingleChildScrollView(
          child: Text('Hola Mundo'),
        ));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
