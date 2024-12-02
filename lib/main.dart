import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/Pages/list_notes_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAcoapuSa9wAdLQztqiLBQiNYy3hDJjjtc",
      appId: "1:819009929689:android:c9617cd3210980861159c8",
      messagingSenderId: "XXX",
      projectId: "notes-1bffc",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: ListNotesPage(),
    );
  }
}
