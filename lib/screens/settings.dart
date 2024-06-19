import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false;

  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    });

    if (_isDarkMode) {
      // Enable dark mode
      _setDarkMode(context);
    } else {
      // Enable light mode
      _setLightMode(context);
    }
  }

  void _setDarkMode(BuildContext context) {
    ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: Colors.blue,
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Colors.purpleAccent),
    );

    // Update the theme
  }

  void _setLightMode(BuildContext context) {
    ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: Colors.blue,
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Colors.purpleAccent),
    );

    // Update the theme
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.blue, Colors.purpleAccent],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(bounds),
          child: const Text(
            'Settings',
            style: TextStyle(color: Colors.white),
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'), // Replace with the actual image URL
                ),
                SizedBox(height: 16.0),
                Text(
                  'Account Name', // Replace with the actual account name
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
              height:
                  32.0), // Add some spacing between the profile section and the settings list
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit Profile Photo'),
            onTap: () {
              // Navigate to edit profile photo page
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.color_lens),
            title: const Text('Change Theme'),
            trailing: Switch(
              value: _isDarkMode,
              onChanged: (value) {
                _toggleTheme(value);
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.star_rate),
            title: const Text('Rate Us'),
            onTap: () {
              // Handle rate us
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Change Name'),
            onTap: () {
              // Navigate to change name page
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Get Notifications'),
            onTap: () {
              // Navigate to notifications settings page
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () {
              // Handle log out
            },
          ),
        ],
      ),
    );
  }
}
