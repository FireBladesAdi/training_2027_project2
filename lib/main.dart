import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//provider for name, could remove if wanted to bcz its pretty useless
final appName = Provider<String>((ref) {
  return "Welcome to the Reefscape Scouting App!!!";
});
void main() {
  runApp(

    ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white10), //ask why background doesnt set color to color i want, only sets to white no matter what I do, and also ask how to do light and dark mode
        ),

        home: Consumer(
          builder: (context, ref, child) {
            final currentTitle = ref.watch(appName);

        return Scaffold(
          appBar: AppBar(title: Text(currentTitle)),

          body: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text("Score L1")),
                    ElevatedButton(onPressed: () {}, child: Text("Score L2")),
                    ElevatedButton(onPressed: () {}, child: Text("Score L3")),
                    ElevatedButton(onPressed: () {}, child: Text("Score L4")),
                    ElevatedButton(onPressed: () {}, child: Text("Score L4")),
                    ElevatedButton(onPressed: () {}, child: Text("Algae Processed")),
                    ElevatedButton(onPressed: () {}, child: Text("Net Score")),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      ),
      ),
    ),
  );
}
