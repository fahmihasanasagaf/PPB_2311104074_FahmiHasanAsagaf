import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

List<String> nama = ["fahmi", "budi", "ani", "susi", "tono"];
List<Color> warna = [Colors.red, Colors.blue, Colors.green, Colors.yellow, Colors.purple];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:  CustomScrollView(
          slivers: [
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  color: warna[index % warna.length],
                  alignment: Alignment.center,
                  child: Text(
                    nama[index % nama.length],
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                childCount: 9,
              ),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                
              ),
            ),
            SliverList(delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                height: 100,
                color: warna[index % warna.length],
                alignment: Alignment.center,
                child: Text(
                  nama[index % nama.length],
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              childCount: 10,
            ))
          ],
        ),
      ),
    );
  }
}