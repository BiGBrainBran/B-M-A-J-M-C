import 'package:flutter/material.dart';

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
        title: const Text(
          "TU PERFIL",
          style: TextStyle(color: Colors.black) ,  // Cambiar color del texto a negro
        ),
        backgroundColor: Colors.white,  // Cambiar color de fondo a blanco
        elevation: 4,  // Establecer la elevación a 4 para la sombra
        iconTheme: IconThemeData(color: Colors.black),  // Cambiar color del icono de volver a negro
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,  // Alinear el texto "Perfil" al centro
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _isEditing
                    ? Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[100],
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  child: TextField(
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
                      border: InputBorder.none,
                    ),
                  ),
                )
                    : Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[100],
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      _description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
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
