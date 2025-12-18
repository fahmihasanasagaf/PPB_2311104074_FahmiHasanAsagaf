import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wisata Banyumas',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const WisataBanyumasPage(),
    );
  }
}

class WisataBanyumasPage extends StatelessWidget {
  const WisataBanyumasPage({super.key});

  final List<Map<String, String>> wisataList = const [
    {
      "nama": "Curug Tirta Sela",
      "gambar": "https://bobobox.com/blog/wp-content//uploads/2024/05/yoga-di-curu-tirta-sella-baturraden-jpg.webp",
      "deskripsi":
          "Curug Tirta Sela terkenal dengan keindahan air terjunnya yang jernih dan suasana alam yang tenang. Cocok untuk relaksasi dan menikmati kesejukan Baturraden."
    },
    {
      "nama": "Curug Telu",
      "gambar": "https://backpackerjakarta.com/wp-content/uploads/2016/07/Curug-Telu-baturaden-purwokerto.jpg",
      "deskripsi":
          "Curug Telu memiliki tiga aliran air terjun yang indah. Dikelilingi hutan dan udara sejuk, tempat ini menjadi favorit wisatawan lokal."
    },
    {
      "nama": "Curug Gurau",
      "gambar": "https://assets.telkomsel.com/public/2024-12/wisata-baturaden.png",
      "deskripsi":
          "Curug Gurau menawarkan panorama air terjun alami yang memukau di kawasan Baturraden. Spot foto yang sangat instagramable!"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rekomendasi Wisata Banyumas'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: wisataList.length,
        itemBuilder: (context, index) {
          final wisata = wisataList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.network(
                    wisata['gambar']!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return const Center(
                          child: Padding(
                        padding: EdgeInsets.all(20),
                        child: CircularProgressIndicator(),
                      ));
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox(
                        height: 200,
                        child: Center(
                          child: Icon(Icons.error, color: Colors.red, size: 40),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        wisata['nama']!,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        wisata['deskripsi']!,
                        textAlign: TextAlign.justify,
                        style:
                            const TextStyle(fontSize: 15, height: 1.4, color: Colors.black87),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "Kamu memilih ${wisata['nama']}!"),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: const Icon(Icons.place, color: Colors.white),
                          label: const Text(
                            "Kunjungi",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
