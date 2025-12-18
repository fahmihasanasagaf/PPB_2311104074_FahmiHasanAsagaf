import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Homepage());
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First App"), backgroundColor: Colors.blue),
      body: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            color: const Color.fromARGB(255, 9, 226, 194),
            child: Center(
              child: Container(height: 50, width: 50, color: Colors.blue),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 100,
            width: 100,
            color: const Color.fromARGB(255, 33, 157, 126),
            child: Center(
              child: Container(height: 50, width: 50, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}