import 'package:flutter/material.dart';
import 'package:appscratch/theme/colors.dart';

/*

PROFILE PAGE

*/

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _descriptionController = TextEditingController();
  String _description = "Esta es mi descripción. Puedo cambiarla según necesite.";
  bool _isEditing = false;

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  void _startEditing() {
    setState(() {
      _isEditing = true;
      _descriptionController.text = _description;
    });
  }

  void _saveDescription() {
    setState(() {
      _description = _descriptionController.text;
      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0), // Ajusta el margen superior
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Icono o imagen de perfil
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.blueAccent,
                ),
              ),

              const SizedBox(height: 20),

              // Nombre de usuario
              Text(
                'Nombre de usuario',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 10),

              // Descripción editable o mostrada
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _isEditing
                    ? TextField(
                  controller: _descriptionController,
                  maxLines: null,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: "Ingresa tu descripción",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                )
                    : Text(
                  _description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Icono para editar la descripción
              _isEditing
                  ? IconButton(
                icon: Icon(Icons.save),
                onPressed: _saveDescription,
              )
                  : IconButton(
                icon: Icon(Icons.edit),
                onPressed: _startEditing,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

