import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:training_2027_project2/main.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.yellow), // Theme
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Reefscape Scouting - All your data is RIGHT HERE')),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: FloatingActionButton(onPressed: () {}, child: Text("Back\n →", textAlign: TextAlign.center,)),
        body: Center(child: const Text("hi")),
      ),
    ),
  );
}