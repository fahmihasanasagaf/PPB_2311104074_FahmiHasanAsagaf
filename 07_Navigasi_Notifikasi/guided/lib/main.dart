import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'dart:convert';
// import 'model/model.dart';
import 'pages/secondpages.dart';

void main() {
  runApp(const MyApp());
}

// Future<void> loadJsonData() async {
//   final String response = await rootBundle.loadString('lib/model/model.json');
//   final data = json.decode(response);
//   Album album = Album.fromJson(data);
//   print(album.title);
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Halaman ke-1",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondPages()),
                );
              },
              child: const Text("Ke Halaman 2"),
            ),
          ],
        ),
      ),
    );
  }
}
