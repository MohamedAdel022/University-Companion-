import 'package:flutter/material.dart';
import 'package:test/screens/edit_profile_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false;
  bool _getNotifications = true;

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

  void _toggleNotifications(bool value) {
    setState(() {
      _getNotifications = value;
    });
    // Handle notifications setting change here
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
                  'Mohamed Adel', // Replace with the actual account name
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
            title: const Text('Edit Profile'),
            onTap: () {
              // Navigate to edit profile photo page
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const EditProfilePage();
              }));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.color_lens),
            title: const Text('Dark Mode'),
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
            leading: const Icon(Icons.notifications),
            title: const Text('Get Notifications'),
            trailing: Switch(
              value: _getNotifications,
              onChanged: (value) {
                _toggleNotifications(value);
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out', style: TextStyle(color: Colors.red)),
            onTap: () {
              // Handle log out
            },
          ),
        ],
      ),
    );
  }
}
