import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'note_controller.dart';

class AddNotePage extends StatelessWidget {
  final NoteController controller = Get.find();
  final TextEditingController titleC = TextEditingController();
  final TextEditingController descC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Catatan")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleC,
              decoration: InputDecoration(labelText: "Judul"),
            ),
            TextField(
              controller: descC,
              decoration: InputDecoration(labelText: "Deskripsi"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.addNote(titleC.text, descC.text);
                Get.back();
              },
              child: Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
