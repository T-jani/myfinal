import 'package:flutter/material.dart';

import 'homepage.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Enable Notifications'),
            trailing: Switch(
              value: true,
              onChanged: (value) {
                // Handle notification settings change
              },
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Theme'),
            trailing: DropdownButton<String>(
              value: 'Light',
              onChanged: (value) {
                // Handle theme selection change
              },
              items: const ['Light', 'Dark']
                  .map((theme) => DropdownMenuItem<String>(
                        value: theme,
                        child: Text(theme),
                      ))
                  .toList(),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
            trailing: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SettingsPage(),
  ));
}
