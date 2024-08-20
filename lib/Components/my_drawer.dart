import 'package:flutter/material.dart';
import 'package:jc_music_app_flutter/Pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // Logo
          DrawerHeader(
              child: Center(
            child: Icon(
              Icons.music_note_outlined,
              size: 40,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          )),

          // Home Tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25),
            child: ListTile(
              title: const Text("H O M E"),
              leading: const Icon(Icons.home),

              // Pop Drawer to Go Home
              onTap: () => Navigator.pop(context),
            ),
          ),

          // Home Tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25),
            child: ListTile(
              title: const Text("S E T T I N G S"),
              leading: const Icon(Icons.settings),
              onTap: () {

                // Pop Drawer
                Navigator.pop(context);

                // Navigate to new Page
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              },
            ),
          )

          // Settings Tile
        ],
      ),
    );
  }
}
