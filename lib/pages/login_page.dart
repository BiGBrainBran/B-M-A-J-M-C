import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/textfield.dart';
import '../theme/colors.dart';
import 'home_page.dart';
import 'package:flutter/widgets.dart';

/*

LOGIN PAGE

*/

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // login method
  void login() {
    // authenticate using your preferred service

    // go to home page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Cambia Icon por Image.asset
              Image.asset(
                'assets/images/icon.png',  // Ruta de la imagen
                width: 80,
                height: 80,
                color: Colors.blueAccent,
              ),

              const SizedBox(height: 25),

              // slogan
              const Text(
                'B M A J M C',
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
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
                controller: passwordController,
                hintText: "Contraseña",
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // forgot password
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Olvidaste tu contraseña?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // sign in button
              MyButton(
                text: "Iniciar sesión",
                onTap: login,
              ),

              const SizedBox(height: 25),

              // don't have an account? Register here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No tienes una cuenta?",
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Registrate gratis aquí",
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

