import 'package:flutter/material.dart';
import '../theme/colors.dart';

/*

HOME PAGE

This page is displayed when the user logs in.
It contains a drawer menu where the user can navigate around the app.

*/

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio"),
        backgroundColor: primaryColor,
        elevation: 4,
      ),
      backgroundColor: backgroundColor,
      drawer: Drawer(
        backgroundColor: backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // drawer header
                const DrawerHeader(
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 30,
                  ),
                ),

                const SizedBox(height: 25),

                // home tile
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: const Text(
                      "I N I C I O",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // pop drawer
                      Navigator.pop(context);
                    },
                  ),
                ),

                // profile tile
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    title: const Text(
                      "P E R F I L",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // pop drawer
                      Navigator.pop(context);

                      // go to profile page
                      Navigator.pushNamed(context, '/profile_page');
                    },
                  ),
                ),
              ],
            ),

            // logout
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
              child: ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: const Text(
                  "S A L I R",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // pop drawer
                  Navigator.pop(context);

                  // go to login page
                  Navigator.pushReplacementNamed(
                      context, '/login_register_page');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
