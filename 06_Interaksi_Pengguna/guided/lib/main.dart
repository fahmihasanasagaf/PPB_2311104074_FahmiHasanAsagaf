import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

TextEditingController inputanNama = TextEditingController();
TextEditingController inputanPassword = TextEditingController();
String nama = "";
int password = 0;
int currentIndex = 0;
List<Widget> pages = [Text("Home"), Text("Menu"), Text("Settings")];
int? item = 1;

class _MyAppState extends State<MyApp> {
  final TextEditingController inputanNama = TextEditingController();
  final TextEditingController inputanPassword = TextEditingController();

  String nama = "";
  int password = 0;
  int currentIndex = 0;
  List<Widget> pages = [Text("Home"), Text("Menu"), Text("Settings")];
  int? item = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("DropDown Button", style: GoogleFonts.poppins(fontSize: 20)),
            DropdownButton<int>(
              value: item,
              items: const [
                DropdownMenuItem(value: 1, child: Text("Jakarta")),
                DropdownMenuItem(value: 2, child: Text("Tegal")),
                DropdownMenuItem(value: 3, child: Text("Bandung")),
              ],
              onChanged: (value) {
                setState(() {
                  item = value;
                });
              },
            ),
            if (item != null)
              Text(
                "Kamu memilih: ${_getKota(item!)}",
                style: GoogleFonts.poppins(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }

  String _getKota(int value) {
    switch (value) {
      case 1:
        return "Jakarta";
      case 2:
        return "Tegal";
      case 3:
        return "Bandung";
      default:
        return "-";
    }
  }
}
