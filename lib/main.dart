import 'package:flutter/material.dart';
import 'package:telegram/screens/chat.dart';
import 'package:telegram/screens/profile.dart';
import 'package:telegram/screens/setting.dart';
import 'package:telegram/screens/login.dart';
import 'package:telegram/screens/signup.dart';
import 'package:telegram/screens/homepage.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telegram',
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        '/chat': (context) => Chat(index: null),
        '/home': (context) => HomePage(),
        '/profile': (context) => Profile(),
        '/setting': (context) => Setting(),
        '/login': (context) => Login(),
        '/signup': (context) => Signup(),
      },
    );
  }
}
