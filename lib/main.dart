import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:training_2027_project2/registerinfopage.dart';
import 'package:http/http.dart' as http;

final appName = Provider<String>((ref) {
  return "Welcome to the Reefscape Scouting App!!!";
});

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: Consumer(
          builder: (context, ref, child) {
            final currentTitle = ref.watch(appName);
            return Scaffold(
              appBar: AppBar(
                title: Text(currentTitle),
                centerTitle: true,
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                child: Text("→"),
              ),
              body: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("☀/🌙"),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            decoration: InputDecoration(
                              labelText: "Team Number",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            decoration: InputDecoration(
                              labelText: "Match Number",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Submit"),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Text(
                        "Counter: 0",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(child: _buildScoringBox("L1 (0)")),
                                SizedBox(width: 8),
                                Expanded(child: _buildScoringBox("L2 (0)")),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(child: _buildScoringBox("L3 (0)")),
                                SizedBox(width: 8),
                                Expanded(child: _buildScoringBox("L4 (0)")),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(child: _buildScoringBox("Algae Processing (0)")),
                                SizedBox(width: 8),
                                Expanded(child: _buildScoringBox("Net Score (0)")),
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
          },
        ),
      ),
    ),
  );
}

Widget _buildScoringBox(String title) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("+"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("-"),
            ),
          ],
        ),
      ],
    ),
  );
}
