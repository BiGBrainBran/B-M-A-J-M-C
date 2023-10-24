import 'package:appscratch/pages/login_page.dart';
import 'package:flutter/material.dart';
import '../components/textfield.dart';
import '../theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';
import 'package:flutter/widgets.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function() onTap;

  const MyButton({
    required this.text,
    required this.onTap,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.blueAccent,  // Border color
        ),
      ),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {


  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  // text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();

  void registrar() async {
    try {
      if (pwController.text.trim() == confirmPwController.text.trim()) {
        FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: pwController.text.trim(),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      }
    }
    catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo con la imagen en lugar del icono
              Image.asset(
                'assets/images/icon.png', // Ruta de la imagen
                width: 80,
                height: 80,
                color: Colors.blue,
              ),

              const SizedBox(height: 25),

              // slogan
              const Text(
                'B M A J M C',
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                    fontSize: 20, fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(height: 50),

              // email textfield
              MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password
              MyTextField(
                controller: pwController,
                hintText: "Contraseña",
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // confirm password
              MyTextField(
                controller: confirmPwController,
                hintText: "Confirma tu contraseña",
                obscureText: true,
              ),

              const SizedBox(height: 25),

              // sign in button
              MyButton(
                text: "REGISTRARSE",
                onTap: registrar,
              ),

              const SizedBox(height: 25),

              // don't have an account? Register here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ya tienes una cuenta?",
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: registrar,
                    child: const Text(
                      "Inicia sesión aquí",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
   }
  }

