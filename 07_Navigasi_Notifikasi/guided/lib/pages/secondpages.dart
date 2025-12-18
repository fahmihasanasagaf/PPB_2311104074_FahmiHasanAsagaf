import 'package:flutter/material.dart';

class SecondPages extends StatelessWidget {
  const SecondPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Halaman 2")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "🖕",
              style: TextStyle(fontSize: 594),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); 
              },
              child: const Text("Kembali"),
            ),
          ],
        ),
      ),
    );
  }
}
