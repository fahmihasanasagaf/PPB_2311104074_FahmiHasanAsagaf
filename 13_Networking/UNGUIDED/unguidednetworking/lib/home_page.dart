import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'note_controller.dart';

class HomePage extends StatelessWidget {
  final NoteController controller = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Catatan")),
      body: Obx(() {
        if (controller.notes.isEmpty) {
          return Center(child: Text("Belum ada catatan"));
        }
        return ListView.builder(
          itemCount: controller.notes.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(controller.notes[index].title),
                subtitle: Text(controller.notes[index].description),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    controller.deleteNote(index);
                  },
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/add');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
