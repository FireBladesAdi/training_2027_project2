import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:training_2027_project2/registerinfopage.dart';
import 'package:http/http.dart' as http;

//change back from segmented button to seperate buttons but spaced out in blocks
enum ScoringOption { L1, L2, L3, L4, algae, net }

//provider for name, could remove if wanted to bcz its pretty useless
final appName = Provider<String>((ref) {
  return "Welcome to the Reefscape Scouting App!!!";
});

void main() {
  runApp(

    ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white10),
        ),

        home: Consumer(
          builder: (context, ref, child) {
            final currentTitle = ref.watch(appName);
            Set<ScoringOption> selectedOption = {ScoringOption.L1};

            return Scaffold(
              appBar: AppBar(title: Text(currentTitle)),
              floatingActionButton: FloatingActionButton(onPressed: () {}, child: Text("→", textAlign: TextAlign.center,)),

              body: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                      //dark mode button, make it actually work and put it in the top corner
                        ElevatedButton(onPressed: () {}, child: const Text("☀/🌙", textAlign: TextAlign.center,)),

                        const SizedBox(height: 30),
                        Container(padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 15), decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(8)), child: const Text("Counter: 0", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                        const SizedBox(height: 30),
                        StatefulBuilder(builder: (context, setStateSegment) { return SegmentedButton<ScoringOption>(segments: const <ButtonSegment<ScoringOption>>[ButtonSegment(value: ScoringOption.L1, label: Text("L1 (0)")), ButtonSegment(value: ScoringOption.L2, label: Text("L2 (0)")), ButtonSegment(value: ScoringOption.L3, label: Text("L3 (0)")), ButtonSegment(value: ScoringOption.L4, label: Text("L4 (0)")), ButtonSegment(value: ScoringOption.algae, label: Text("Algae Processed (0)")), ButtonSegment(value: ScoringOption.net, label: Text("Net Score (0)"))], selected: selectedOption, onSelectionChanged: (newSelection) { setStateSegment(() { selectedOption = newSelection; }); }); }),
                        const SizedBox(height: 30),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(onPressed: () {},
                                  child: const Text("+")),
                              const SizedBox(width: 16),
                              ElevatedButton(onPressed: () {}, child: const Text("-"))]),
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
