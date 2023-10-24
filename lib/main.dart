import 'package:flutter/material.dart';
import 'auth/login_or_register.dart';
import 'pages/home_page.dart';
import 'pages/map_page.dart';
import 'pages/profile_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
      theme: ThemeData(),
      routes: {
        '/home_page': (context) => HomePage(),
        '/map_page': (context) => MapSample(), // Asegúrate de que coincida con la clase MapSample
        '/profile_page': (context) => ProfilePage(),
      },
    );
  }
}
