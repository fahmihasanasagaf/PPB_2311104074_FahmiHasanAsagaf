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
// String nama ="";
// int password = 0;

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: inputanNama,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hint: Text("Masukan Nama..."),
//               ),
//             ),
//             TextField(
//               controller: inputanPassword,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hint: Text("Masukan Password..."),
//               ),
//             ),
//             ElevatedButton(onPressed: () {
//               setState(() {
//                nama = inputanNama.text;
//                password = int.parse(inputanPassword.text);
//               });
//             }, child: Text("Submit")),
//             Text("$nama"),
//             Text("$password"),
//           ],
//         ),
//       ),
//     );
//   }
// }