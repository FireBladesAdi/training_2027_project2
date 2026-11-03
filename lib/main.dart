import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:training_2027_project2/registerinfopage.dart';

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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white10), //ask why background doesnt set color to color i want, only sets to white no matter what I do, and also ask how to do light and dark mode
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
                        const SizedBox(height: 20),
                        Container(padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12), decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(8)), child: const Text("Counter: 0", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                        const SizedBox(height: 20),
                        StatefulBuilder(builder: (context, setStateSegment) { return SegmentedButton<ScoringOption>(segments: const <ButtonSegment<ScoringOption>>[ButtonSegment(value: ScoringOption.L1, label: Text("L1")), ButtonSegment(value: ScoringOption.L2, label: Text("L2")), ButtonSegment(value: ScoringOption.L3, label: Text("L3")), ButtonSegment(value: ScoringOption.L4, label: Text("L4")), ButtonSegment(value: ScoringOption.algae, label: Text("Algae Processed")), ButtonSegment(value: ScoringOption.net, label: Text("Net Score"))], selected: selectedOption, onSelectionChanged: (newSelection) { setStateSegment(() { selectedOption = newSelection; }); }); }),
                        const SizedBox(height: 20),
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
