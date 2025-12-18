import 'package:flutter/material.dart';
import 'package:guided/databaseHelper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<Map<String, dynamic>>> datamahasiswa;

@override
void initState() {
  super.initState();
  loadData();
}

void loadData() async {
  await DatabaseHelper().create({"nama": "Fahmi", "nim": 2311104074});
  setState(() {
    datamahasiswa = DatabaseHelper().read();
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Mahasiswa")),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: datamahasiswa,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Belum ada data"));
          }

          final data = snapshot.data!;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final mahasiswa = data[index];
              return ListTile(
                title: Text(mahasiswa['nama'].toString()),
                subtitle: Text("NIM: ${mahasiswa['nim']}"),
              );
            },
          );
        },
      ),
    );
  }
}