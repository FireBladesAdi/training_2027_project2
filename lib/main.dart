import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:training_2027_project2/registerinfopage.dart';

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
              floatingActionButton: FloatingActionButton(onPressed: () {}, child: Text("Data Page", textAlign: TextAlign.center,)),

              body: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        /* want to make all the buttons besides + and - as an elevated button and make + and - centered next to each other and below the segmented button
                        SizedBox(
                          height: 65,
                          width: 300,
                          child: TextField(
                            decoration: ,
                          )
                        ) */
                        ElevatedButton(onPressed: () {}, child: Text("Score L1")),
                        ElevatedButton(onPressed: () {}, child: Text("Score L2")),
                        ElevatedButton(onPressed: () {}, child: Text("Score L3")),
                        ElevatedButton(onPressed: () {}, child: Text("Score L4")),
                        ElevatedButton(onPressed: () {}, child: Text("Score L4")),
                        ElevatedButton(onPressed: () {}, child: Text("Algae Processed")),
                        ElevatedButton(onPressed: () {}, child: Text("Net Score")),
                        ElevatedButton(onPressed: () {}, child: Text("+")),
                        ElevatedButton(onPressed: () {}, child: Text("-")),
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
