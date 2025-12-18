// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// TextEditingController inputanNama = TextEditingController();
// TextEditingController inputanPassword = TextEditingController();
// String nama = "";
// int password = 0;
// int currentIndex = 0;
// List <Widget> pages = [Text("Home"), Text("Menu"), Text("Settings")];

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: currentIndex,
//           onTap: (value) {
//             setState(() {
//               currentIndex = value;
//             });
//           },
//           items: [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
//             BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.settings),
//               label: "Settings",
//             ),
//           ],
//         ),
//         body: pages[currentIndex],
//       ),
//     );
//   }
// }