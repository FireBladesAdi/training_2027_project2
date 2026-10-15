/*
void main() {
  runApp(
   MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Clicker')),
        body: Center(
        child: Column(
            children[
            const Text("hi"),
            ElevatedButton(
            onPressed: () {},
        child: Text("Central Button"),
      ),
      ],
    ),
        ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: Text('Corner Button'),
    ), //
  ), //
  )
  , //
  );
}
*/
import 'package:flutter/material.dart';

class Teamlogo extends StatelessWidget {
  final String name;

  const Teamlogo({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.groups),
        const SizedBox(width: 15),
        Text(name),
      ],
    );
    throw UnimplementedError();
  }
}

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white38),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("The Team")),
      body: Column(
        children: [
          Teamlogo(name: "Bear Metal"),
          Teamlogo(name: "5 matches scouted"),
        ],
      ),
  )
    ),
  );
}
