import 'package:flutter/material.dart';

class Driver {
  final String name;
  final int age;
  final String phoneNumber;

  Driver({required this.name, required this.age, required this.phoneNumber});
}

void main() => runApp(MaterialApp(
  home: DriversScreen(),
));

class DriversScreen extends StatelessWidget {
  final List<Driver> drivers = [
    Driver(name: 'Juan Pérez', age: 19, phoneNumber: '555-111-1111'),
    Driver(name: 'María García', age: 32, phoneNumber: '555-222-2222'),
    Driver(name: 'Pedro López', age: 53, phoneNumber: '555-333-3333'),
    Driver(name: 'Ana Martínez', age: 22, phoneNumber: '555-444-4444'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conductores Asociados'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.teal],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: drivers.length,
          itemBuilder: (context, index) {
            final driver = drivers[index];
            return Card(
              elevation: 5,
              margin: EdgeInsets.all(16),
              color: Colors.white,
              child: ListTile(
                leading: Icon(Icons.drive_eta, color: Colors.blue),
                title: Text(
                  driver.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Edad: ${driver.age} años'),
                    Text('Teléfono: ${driver.phoneNumber}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
