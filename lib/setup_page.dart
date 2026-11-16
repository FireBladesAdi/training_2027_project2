import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:training_2027_project2/main.dart';

class SetupPage extends ConsumerWidget {
  const SetupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTitle = ref.watch(appNameProvider);
    final isDarkMode = ref.watch(themeToggleProvider);
    final selectedPosition = ref.watch(positionProvider);
    final teamsAsync = ref.watch(eventTeamsProvider);

    Set<String> redSelection = {};
    if (selectedPosition == "Red 1" || selectedPosition == "Red 2" || selectedPosition == "Red 3") {
      redSelection = {selectedPosition};
    }

    Set<String> blueSelection = {};
    if (selectedPosition == "Blue 1" || selectedPosition == "Blue 2" || selectedPosition == "Blue 3") {
      blueSelection = {selectedPosition};
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(currentTitle),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go('/info');
              },
              child: const Text("History"),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                context.go('/scout');
              },
              child: const Text("→"),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("☀/🌙"),
                Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    ref.read(themeToggleProvider.notifier).toggle();
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "Match Setup",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) {
                      ref.read(teamNumberProvider.notifier).update(value);
                    },
                    decoration: const InputDecoration(
                      labelText: "Team Number",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) {
                      ref.read(matchNumberProvider.notifier).update(value);
                    },
                    decoration: const InputDecoration(
                      labelText: "Match Number",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Text("Red Alliance"),
            const SizedBox(height: 6),
            SegmentedButton<String>(
              showSelectedIcon: false,
              emptySelectionAllowed: true,
              segments: const [
                ButtonSegment(value: "Red 1", label: Text("Red 1")),
                ButtonSegment(value: "Red 2", label: Text("Red 2")),
                ButtonSegment(value: "Red 3", label: Text("Red 3")),
              ],
              selected: redSelection,
              onSelectionChanged: (newSelection) {
                if (newSelection.isNotEmpty) {
                  ref.read(positionProvider.notifier).update(newSelection.first);
                }
              },
            ),
            const SizedBox(height: 12),
            const Text("Blue Alliance"),
            const SizedBox(height: 6),
            SegmentedButton<String>(
              showSelectedIcon: false,
              emptySelectionAllowed: true,
              segments: const [
                ButtonSegment(value: "Blue 1", label: Text("Blue 1")),
                ButtonSegment(value: "Blue 2", label: Text("Blue 2")),
                ButtonSegment(value: "Blue 3", label: Text("Blue 3")),
              ],
              selected: blueSelection,
              onSelectionChanged: (newSelection) {
                if (newSelection.isNotEmpty) {
                  ref.read(positionProvider.notifier).update(newSelection.first);
                }
              },
            ),
            const SizedBox(height: 15),
            const Text(
              "Teams at Event (2026pncmp)",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: teamsAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text("Error loading teams: $error")),
                data: (teams) => ListView(
                  children: [
                    for (var team in teams)
                      Container(
                        margin: const EdgeInsets.only(bottom: 6),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Text("${team.teamNumber} - ${team.teamName}"),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
