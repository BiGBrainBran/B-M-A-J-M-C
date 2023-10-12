import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/textfield.dart';
import '../theme/colors.dart';

/*

REGISTER PAGE

*/

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  // text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();

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
              // logo
              const Icon(
                Icons.person,
                size: 80,
                color: Colors.white,
              ),

              const SizedBox(height: 25),

              // slogan
              const Text(
                'B M A J M C',
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 20,
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
                onTap: () {},
              ),

              const SizedBox(height: 25),

              // don't have an account? Register here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ya tienes una cuenta?",
                    style: TextStyle(color: Colors.deepPurple[50]),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: onTap,
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
