import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:training_2027_project2/classes.dart';
import 'package:training_2027_project2/info.dart';
import 'package:training_2027_project2/setup_page.dart';

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

  void reset() {
    state = 0;
  }
}

class ThemeToggle extends Notifier<bool> {
  @override
  bool build() => false;

  void toggle() {
    state = !state;
  }
}

class TextInputNotifier extends Notifier<String> {
  @override
  String build() => "";

  void update(String newText) {
    state = newText;
  }
}

class MatchesNotifier extends Notifier<List<MatchData>> {
  @override
  List<MatchData> build() => [];

  void addMatch(MatchData match) {
    List<MatchData> updatedList = [];
    for (var item in state) {
      updatedList.add(item);
    }
    updatedList.add(match);
    state = updatedList;
  }
}

final appNameProvider = Provider<String>((ref) {
  return "Welcome to the Reefscape Scouting App!!!";
});

final themeToggleProvider = NotifierProvider<ThemeToggle, bool>(ThemeToggle.new);
final teamNumberProvider = NotifierProvider<TextInputNotifier, String>(TextInputNotifier.new);
final matchNumberProvider = NotifierProvider<TextInputNotifier, String>(TextInputNotifier.new);
final positionProvider = NotifierProvider<TextInputNotifier, String>(TextInputNotifier.new);
final matchesProvider = NotifierProvider<MatchesNotifier, List<MatchData>>(MatchesNotifier.new);

final l1Provider = NotifierProvider<Counter, int>(Counter.new);
final l2Provider = NotifierProvider<Counter, int>(Counter.new);
final l3Provider = NotifierProvider<Counter, int>(Counter.new);
final l4Provider = NotifierProvider<Counter, int>(Counter.new);
final algaeProvider = NotifierProvider<Counter, int>(Counter.new);
final netProvider = NotifierProvider<Counter, int>(Counter.new);

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SetupPage(),
    ),
    GoRoute(
      path: '/scout',
      builder: (context, state) => const ScoutingScreen(),
    ),
    GoRoute(
      path: '/info',
      builder: (context, state) => const RegisterInfoPage(),
    ),
  ],
);

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

    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
    );
  }
}

class ScoutingScreen extends ConsumerWidget {
  const ScoutingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTitle = ref.watch(appNameProvider);
    final teamNumber = ref.watch(teamNumberProvider);
    final matchNumber = ref.watch(matchNumberProvider);
    final position = ref.watch(positionProvider);
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
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text("←"),
            ),
            ElevatedButton(
              onPressed: () {
                if (teamNumber.isNotEmpty && matchNumber.isNotEmpty) {
                  final newMatch = MatchData(
                    int.parse(teamNumber),
                    int.parse(matchNumber),
                    position.isEmpty ? "Red 1" : position,
                    l1,
                    l2,
                    l3,
                    l4,
                    algae,
                    net,
                  );

                  ref.read(matchesProvider.notifier).addMatch(newMatch);

                  ref.read(l1Provider.notifier).reset();
                  ref.read(l2Provider.notifier).reset();
                  ref.read(l3Provider.notifier).reset();
                  ref.read(l4Provider.notifier).reset();
                  ref.read(algaeProvider.notifier).reset();
                  ref.read(netProvider.notifier).reset();

                  context.go('/');
                }
              },
              child: const Text("Submit"),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/info');
              },
              child: const Text("→"),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              "Team: ${teamNumber.isEmpty ? 'N/A' : teamNumber} | Match: ${matchNumber.isEmpty ? 'N/A' : matchNumber} | ${position.isEmpty ? 'None' : position}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
    final isDarkMode = ref.watch(themeToggleProvider);
    final borderColor = isDarkMode ? Colors.white70 : Colors.black;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 100,
                height: 75,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: borderColor, width: 2),
                    ),
                  ),
                  onPressed: () {
                    ref.read(provider.notifier).increment();
                  },
                  child: const Text("+", style: TextStyle(fontSize: 34)),
                ),
              ),
              Text(
                "$label ($count)",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 100,
                height: 75,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: borderColor, width: 2),
                    ),
                  ),
                  onPressed: () {
                    ref.read(provider.notifier).decrement();
                  },
                  child: const Text("-", style: TextStyle(fontSize: 34)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
