import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../theme/colors.dart';
import 'package:flutter/widgets.dart';
import 'map_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _destinationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 1,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'B M A J M C',
          style: TextStyle(fontSize: 18, color: Colors.blueAccent),
        ),
        actions: [
          IconButton(
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.help, color: Colors.black),
                Text(
                  'Soporte',
                  style: TextStyle(fontSize: 8, color: Colors.black),
                ),
              ],
            ),
            onPressed: () {
              // Add your help functionality here
            },
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      drawer: Drawer(
        backgroundColor: backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/icon.png',
                  width: 80,
                  height: 200,
                  color: Colors.blueAccent,
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                    title: const Text(
                      "I N I C I O",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    title: const Text(
                      "P E R F I L",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/profile_page');
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
              child: ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    Text(
                      'S A L I R',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(
                      context, '/login_register_page');
                },
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/map_page'); // Redirige a map_page.dart
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(120, 90),
                      padding: EdgeInsets.all(10.0),
                    ),
                    child: Column(
                      children: [
                        Image.asset('assets/images/moto.png', width: 40, height: 40),
                        SizedBox(height: 10),
                        AutoSizeText(
                          'Moto',
                          style: TextStyle(color: Colors.black),
                          maxLines: 1,
                          minFontSize: 10,
                          maxFontSize: 18,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/map_page'); // Redirige a map_page.dart
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(120, 90),
                      padding: EdgeInsets.all(10.0),
                    ),
                    child: Column(
                      children: [
                        Image.asset('assets/images/car.png', width: 40, height: 40),
                        SizedBox(height: 10),
                        AutoSizeText(
                          'Carro',
                          style: TextStyle(color: Colors.black),
                          maxLines: 1,
                          minFontSize: 10,
                          maxFontSize: 18,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/map_page'); // Redirige a map_page.dart
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(120, 90),
                      padding: EdgeInsets.all(10.0),
                    ),
                    child: Column(
                      children: [
                        Image.asset('assets/images/camion.png', width: 40, height: 40),
                        SizedBox(height: 10),
                        AutoSizeText(
                          'Mensajería',
                          style: TextStyle(color: Colors.black),
                          maxLines: 1,
                          minFontSize: 10,
                          maxFontSize: 18,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/map_page'); // Redirige a map_page.dart
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,  // Fondo blanco
                  onPrimary: Colors.blue,  // Color del texto
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.blue),  // Borde azul
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.expand_circle_down_outlined,
                      color: Colors.blue,  // Color del icono
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      '¿A donde te llevamos?',
                      style: TextStyle(color: Colors.blue),  // Color del texto
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
