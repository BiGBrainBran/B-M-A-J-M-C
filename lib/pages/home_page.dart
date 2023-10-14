import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../theme/colors.dart';
import 'package:flutter/widgets.dart';

// ... Existing imports

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 1,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),  // Set the icon color to black
        title: Text(
          'BMAJMC',
          style: TextStyle(fontSize: 18, color: Colors.black),  // Set the text color to black
        ),
        actions: [
          IconButton(
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.help, color: Colors.black),
                Text(
                  'Soporte',
                  style: TextStyle(fontSize: 8, color: Colors.black),  // Set the text color to black
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
                      // Add functionality for "Solicitar Moto"
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(120, 90),  // Adjusted minimumSize
                      padding: EdgeInsets.all(10.0),  // Adjusted padding
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.motorcycle, color: Colors.black),  // Set icon color to black
                        SizedBox(height: 10), // Add some space between icon and text
                        AutoSizeText(
                          'Moto',
                          style: TextStyle(color: Colors.black),
                          maxLines: 1,
                          minFontSize: 10,
                          maxFontSize: 18,
                          textAlign: TextAlign.left, // Align text to the left
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality for "Solicitar Carro"
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(120, 90),  // Adjusted minimumSize
                      padding: EdgeInsets.all(10.0),  // Adjusted padding
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.directions_car, color: Colors.black),  // Set icon color to black
                        SizedBox(height: 10), // Add some space between icon and text
                        AutoSizeText(
                          'Carro',
                          style: TextStyle(color: Colors.black),
                          maxLines: 1,
                          minFontSize: 10,
                          maxFontSize: 18,
                          textAlign: TextAlign.left, // Align text to the left
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality for "Servicio de Mensajería"
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(120, 90),  // Adjusted minimumSize
                      padding: EdgeInsets.all(10.0),  // Adjusted padding
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.local_shipping, color: Colors.black),  // Set icon color to black
                        SizedBox(height: 10), // Add some space between icon and text
                        AutoSizeText(
                          'Mensajería',
                          style: TextStyle(color: Colors.black),
                          maxLines: 1,
                          minFontSize: 10,
                          maxFontSize: 18,
                          textAlign: TextAlign.left, // Align text to the left
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
