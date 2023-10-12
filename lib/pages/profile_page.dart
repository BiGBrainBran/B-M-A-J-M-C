import 'package:appscratch/theme/colors.dart';
import 'package:flutter/material.dart';

/*

PROFILE PAGE

*/

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      backgroundColor: backgroundColor,
    );
  }
}
