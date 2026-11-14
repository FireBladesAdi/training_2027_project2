import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:training_2027_project2/registerinfopage.dart';
import 'package:http/http.dart' as http;

class Counter extends Notifier<int> {
  @override
  int build() => 0;

  void increment() {
    state = state + 1;
  }

  void decrement() {
    if (state > 0) {
      state = state - 1;
    }
  }
}

class ThemeToggle extends Notifier<bool> {
  @override
  bool build() => false;

  void toggle() {
    state = !state;
  }
}

final appNameProvider = Provider<String>((ref) {
  return "Welcome to the Reefscape Scouting App!!!";
});

final themeToggleProvider = NotifierProvider<ThemeToggle, bool>(ThemeToggle.new);
final l1Provider = NotifierProvider<Counter, int>(Counter.new);
final l2Provider = NotifierProvider<Counter, int>(Counter.new);
final l3Provider = NotifierProvider<Counter, int>(Counter.new);
final l4Provider = NotifierProvider<Counter, int>(Counter.new);
final algaeProvider = NotifierProvider<Counter, int>(Counter.new);
final netProvider = NotifierProvider<Counter, int>(Counter.new);

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeToggleProvider);

    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: const ScoutingScreen(),
    );
  }
}

class ScoutingScreen extends ConsumerWidget {
  const ScoutingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTitle = ref.watch(appNameProvider);
    final isDarkMode = ref.watch(themeToggleProvider);
    final l1 = ref.watch(l1Provider);
    final l2 = ref.watch(l2Provider);
    final l3 = ref.watch(l3Provider);
    final l4 = ref.watch(l4Provider);
    final algae = ref.watch(algaeProvider);
    final net = ref.watch(netProvider);
    final totalCounter = l1 + l2 + l3 + l4 + algae + net;

    return Scaffold(
      appBar: AppBar(
        title: Text(currentTitle),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 64),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Submit"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("→"),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
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
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      labelText: "Team Number",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      labelText: "Match Number",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Text(
                "Counter: $totalCounter",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(child: ScoringBox(label: "L1", provider: l1Provider)),
                        const SizedBox(width: 8),
                        Expanded(child: ScoringBox(label: "L2", provider: l2Provider)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(child: ScoringBox(label: "L3", provider: l3Provider)),
                        const SizedBox(width: 8),
                        Expanded(child: ScoringBox(label: "L4", provider: l4Provider)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(child: ScoringBox(label: "Algae Processing", provider: algaeProvider)),
                        const SizedBox(width: 8),
                        Expanded(child: ScoringBox(label: "Net Score", provider: netProvider)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScoringBox extends ConsumerWidget {
  final String label;
  final NotifierProvider<Counter, int> provider;

  const ScoringBox({
    super.key,
    required this.label,
    required this.provider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(provider);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$label ($count)",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(provider.notifier).increment();
                },
                child: const Text("+"),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(provider.notifier).decrement();
                },
                child: const Text("-"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
