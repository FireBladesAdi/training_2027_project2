import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.yellow), // Theme
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Reefscape Scouting')),
        body: const Center(child: Text('Hello, World!')),
      ),
    ),
  );
}