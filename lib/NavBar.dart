import 'package:flutter/material.dart';
import 'package:bmi_calculator/AboutBMI.dart';

class NavBar extends StatelessWidget {
  final Function changeTheme;
  final bool light;
  const NavBar({super.key, required this.changeTheme, required this.light});

  @override
  Widget build(BuildContext context) {
    // Get the current theme (either light or dark)
    final ThemeData theme = Theme.of(context);

    return Drawer(
      backgroundColor: theme.scaffoldBackgroundColor, // Use current theme scaffold background color
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Container(
              child: Row(
                children: [
                  Text(
                    'BMI Calculator',
                    style: theme.textTheme.titleLarge, // Use current theme titleLarge text style
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: theme.iconTheme.color, // Use current theme icon color
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                // Check if the current screen is not the home screen
                if (ModalRoute.of(context)!.settings.name != '/') {
                  Navigator.pushNamed(context, '/').then((_) {
                    Navigator.pop(context);
                  });
                } else {
                  Navigator.pop(context);
                }
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                // Check if the current screen is not the About screen
                if (ModalRoute.of(context)!.settings.name != '/about') {
                  Navigator.pushNamed(context, '/about').then((_) {
                    Navigator.pop(context);
                  });
                } else {
                  Navigator.pop(context);
                }
              },
            ),
            SwitchListTile(
              title: Text(
                light ? 'Dark Mode' : 'Dark Mode ON',
                style: TextStyle(color: theme.textTheme.bodySmall?.color), // Use current theme text color
              ),
              value: !light,
              activeColor: Colors.grey[100],
              onChanged: (bool value) {
                changeTheme();
              },
            ),
            // display at bottom text
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox.square(
                  dimension: 380,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
