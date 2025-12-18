import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 4, 1, 79),
            height: 300,
            width: 300,
            ),
            Container(
            color: const Color.fromARGB(255, 4, 54, 235),
            height: 280,
            width: 280,
            ),
            Container(
            color: Colors.blue,
            height: 260,
            width: 260,
            ),
        ]
      )
    );
  }
}