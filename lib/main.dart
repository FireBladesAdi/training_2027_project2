import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white70),
          ),

          home: Scaffold(
            appBar: AppBar(title: Text("Welcome to the Reefscape Scouting App!"),),

              body: Column(
                children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Score L1")
                ),
                ElevatedButton(
                      onPressed: () {},
                      child: Text("Score L2")
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text("Score L3")
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text("Score L4")
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text("Algae Processed")
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text("Net Score")
                  ),
                ],
          )

      )
      )
  );
}