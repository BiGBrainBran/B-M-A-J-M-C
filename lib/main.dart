import 'package:flutter/material.dart';
import 'auth/login_or_register.dart';
import 'pages/home_page.dart';
import 'pages/map_page.dart';
import 'pages/profile_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {

  bool estaAdentro = false; // Puedes inicializarlo en true si el usuario está adentro, o en false si está afuera.

try{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );




  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
    if (user != null) {
      estaAdentro = true;
      print ('User is currently signed in!');
    }
  });
}  catch (e){print(e);}


  runApp(MyApp(estaAdentro));
}


class MyApp extends StatelessWidget {

  MyApp(this.estaAdentro);
  final bool estaAdentro;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: estaAdentro? HomePage(): LoginOrRegister(),
      theme: ThemeData(),
      routes: {
        '/home_page': (context) => HomePage(),
        '/map_page': (context) => MapSample(), // Asegúrate de que coincida con la clase MapSample
        '/profile_page': (context) => ProfilePage(),
      },
    );
  }
}
