import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/Model/note.dart';

class NotesServices {
  static CollectionReference _notesCollection =
      FirebaseFirestore.instance.collection('notes');

  static Future<void> addNotes(Note note) async {
    await _notesCollection.add({
// 'userId': user.id,
      'title': note.title,
      'content': note.content,
      'time': DateTime.now()
    });
  }

  static Future<void> updateNotes(Note note) async {
    await _notesCollection.doc(note.id).set({
// 'userId': user.id,
      'title': note.title,
      'content': note.content,
      'time': DateTime.now()
    });
  }

  static Future<List<Note>> getNotes() async {
    QuerySnapshot snapshot =
        await _notesCollection.orderBy('time', descending: true).get();
    var documents = snapshot.docs;
    List<Note> notes = [];
    for (var document in documents) {
      final data = document.data() as Map<String,dynamic>?;
      notes.add(Note(
          id: document.id,
          title: data?['title'] ?? 'No Title',
          content: data?['content'] ?? 'No Content',
          time: data?['time'].toString() ?? 'No Time'));
    }
    return notes;
  }

  static Future<void> deleteNote(String id) async {
    await _notesCollection.doc(id).delete();
  }
}
