import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BiodataPage(),
    );
  }
}

class BiodataPage extends StatelessWidget {
  const BiodataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Biodata Saya"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                "assets/profile.jpg",
              ), // ganti foto di assets
            ),
            const SizedBox(height: 20),
            const Text(
              "Nama: Fahmi Hasan Asagaf",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text("NIM: 231110474"),
            const Text("Jurusan: Software engineering"),
            const Text("Hobi: Coding & Game"),
            const Text("Alamat: Baturraden, Jawa Tengah"),
          ],
        ),
      ),
    );
  }
}
