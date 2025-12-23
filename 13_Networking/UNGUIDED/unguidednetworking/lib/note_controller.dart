import 'package:get/get.dart';
import 'note.dart';

class NoteController extends GetxController {
  var notes = <Note>[].obs;

  void addNote(String title, String desc) {
    notes.add(Note(title: title, description: desc));
  }

  void deleteNote(int index) {
    notes.removeAt(index);
  }
}
