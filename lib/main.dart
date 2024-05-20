import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:one_password/readit.dart';
import 'package:one_password/saveit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          "saveit": (context) => saveIt(),
          "readit": (context) => readIt()
        },
        initialRoute: "saveit",
        debugShowCheckedModeBanner: false,
        home: saveIt());
  }
}
