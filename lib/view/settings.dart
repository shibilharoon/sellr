import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkThemeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: const Text(
                'Dark Theme',
                style: TextStyle(fontSize: 18),
              ),
              subtitle: const Text(
                'Switch to a darker theme for better viewing experience',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              leading: const Icon(Icons.dark_mode),
              trailing: Switch(
                value: _darkThemeEnabled,
                onChanged: (value) {
                  setState(() {
                    _darkThemeEnabled = value;
                    // Implement theme toggle logic here
                  });
                },
                activeColor: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text(
                'Help Center',
                style: TextStyle(fontSize: 18),
              ),
              subtitle: const Text(
                'Find answers to commonly asked questions',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              leading: const Icon(Icons.help_outline),
              onTap: () {
                // Navigate to Help Center
              },
            ),
            const Divider(height: 20, thickness: 1),
            ListTile(
              title: const Text(
                'Log Out',
                style: TextStyle(fontSize: 18),
              ),
              subtitle: const Text(
                'Log out from your account',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              leading: const Icon(Icons.exit_to_app),
              onTap: () {
                // Implement log out logic here
              },
            ),
          ],
        ),
      ),
    );
  }
}
