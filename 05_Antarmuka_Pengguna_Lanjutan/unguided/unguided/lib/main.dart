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

  // --- BAGIAN YANG DIPERBAIKI ---
  // URL gambar diganti dengan yang valid dan bisa diakses publik.
  final List<Map<String, String>> wisataList = const [
    {
      "nama": "Curug Tirta Sela",
      "gambar":
          "https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/11/2024/04/15/Screenshot_20240415_113848_Instagram-3983365160.jpg",
      "deskripsi":
          "Curug Tirta Sela terkenal dengan keindahan air terjunnya yang jernih dan suasana alam yang tenang. Cocok untuk relaksasi dan menikmati kesejukan Baturraden."
    },
    {
      "nama": "Curug Telu",
      "gambar":
          "https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/11/2024/07/02/Screenshot_20240702_181354_Instagram-4019805074.jpg", 
      "deskripsi":
          "Curug Telu memiliki tiga aliran air terjun yang indah. Dikelilingi hutan dan udara sejuk, tempat ini menjadi favorit wisatawan lokal dan pencinta alam."
    },
    {
      "nama": "Curug Gurau",
      "gambar":
          "https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p1/328/2025/09/23/WhatsApp-Image-2025-09-22-at-084455-2674322531.jpeg",
      "deskripsi":
          "Curug Gurau menawarkan panorama air terjun alami yang memukau di kawasan Baturraden. Spot foto yang sangat instagramable dan cocok untuk healing!"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 230.0,
            floating: false,
            pinned: true,
            backgroundColor: Colors.teal,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text(
                'Rekomendasi Wisata Banyumas',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Gunung_Slamer_dari_Limpakuwus_%281%29.jpg/1200px-Gunung_Slamer_dari_Limpakuwus_%281%29.jpg', 
                    fit: BoxFit.cover,
                  ),
                  Container(color: const Color.fromARGB(115, 255, 252, 252)),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final wisata = wisataList[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 6,
                    shadowColor: Colors.teal.withOpacity(0.4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20)),
                          child: Image.network(
                            wisata['gambar']!,
                            height: 220,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) return child;
                              return const SizedBox(
                                height: 220,
                                child: Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.teal)),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const SizedBox(
                                height: 220,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.broken_image_outlined,
                                          color: Colors.grey, size: 40),
                                      SizedBox(height: 8),
                                      Text("Gagal memuat gambar", style: TextStyle(color: Colors.grey)),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                wisata['nama']!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                wisata['deskripsi']!,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  fontSize: 15,
                                  height: 1.4,
                                ),
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
                                        duration:
                                            const Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  icon: const Icon(Icons.place,
                                      color: Colors.white),
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
                  ),
                );
              },
              childCount: wisataList.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(
                  "🌿 Jelajahi keindahan Banyumas dan nikmati pesonanya! 🌿",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.teal.shade800,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}