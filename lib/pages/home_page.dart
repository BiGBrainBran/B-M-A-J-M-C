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
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'BMAJMC',
          style: TextStyle(fontSize: 18, color: Colors.black),
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
            // ... Drawer content
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
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add functionality for "Solicitar Moto"
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: Size(120, 80), // Ajusta el ancho mínimo y alto aquí
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.motorcycle, color: Colors.black),
                          SizedBox(height: 10),  // Espacio entre el icono y el texto
                          AutoSizeText(
                            'Moto',
                            style: TextStyle(color: Colors.black),
                            maxLines: 1,
                            minFontSize: 10,
                            maxFontSize: 18,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add functionality for "Solicitar Carro"
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: Size(120, 80), // Ajusta el ancho mínimo y alto aquí
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.directions_car, color: Colors.black),
                          SizedBox(height: 10),  // Espacio entre el icono y el texto
                          AutoSizeText(
                            'Carro',
                            style: TextStyle(color: Colors.black),
                            maxLines: 1,
                            minFontSize: 10,
                            maxFontSize: 18,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add functionality for "Servicio de Mensajería"
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: Size(120, 80), // Ajusta el ancho mínimo y alto aquí
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_shipping, color: Colors.black),
                          SizedBox(height: 10),  // Espacio entre el icono y el texto
                          AutoSizeText(
                            'Mensajería',
                            style: TextStyle(color: Colors.black),
                            maxLines: 1,
                            minFontSize: 10,
                            maxFontSize: 18,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
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
