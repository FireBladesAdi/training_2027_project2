import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:training_2027_project2/main.dart';

class RegisterInfoPage extends ConsumerWidget {
  const RegisterInfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matches = ref.watch(matchesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Scouted Matches"),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go('/scout');
              },
              child: const Text("←"),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            if (matches.isEmpty)
              const Text(
                "No matches scouted yet!",
                style: TextStyle(fontSize: 18),
              ),
            for (var match in matches)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Team ${match.teamNumber} - Match ${match.matchNumber} (${match.position})",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text("L1: ${match.l1}, L2: ${match.l2}, L3: ${match.l3}, L4: ${match.l4}"),
                    Text("Algae: ${match.algae}, Net: ${match.net}"),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
