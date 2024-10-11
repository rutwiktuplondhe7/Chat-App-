import 'package:flutter/material.dart';

import '../services/auth/auth_services.dart';
import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    //get authservice
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //logo
              DrawerHeader(
                child: Icon(
                  Icons.message,
                  size: 40,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

              //home list tile
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.home),
                      title: const Text('H O M E'),
                      onTap: () {
                        //pop drawer
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),

              //settings list tile
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('S E T T I N G S'),
                      onTap: () {
                        //pop drawer
                        Navigator.pop(context);

                        //navigate to settings page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingsPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),

          //logout list tile
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 25),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('L O G O U T'),
                  onTap: logout,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
