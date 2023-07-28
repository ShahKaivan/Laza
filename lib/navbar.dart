import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool isDarkModeEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              height: 170.0,
              color: Colors.white,
              child: const Row(
                children: [
                  SizedBox(
                    width: 10.0,
                  ),
                  CircleAvatar(
                    radius: 35.0,
                    foregroundImage: AssetImage('images/Profile.jpeg'),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Kaivan Shah',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text('Verified Profile',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Icon(Icons.verified,
                            color: Colors.green,
                            size: 16.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  const Icon(Icons.sunny),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Text('Dark Mode'),
                  const SizedBox(
                    width: 108.0,
                  ),
                  Expanded(
                      child: Switch(value: isDarkModeEnabled, onChanged: (value){
                        setState(() {
                          isDarkModeEnabled = value;
                        });
                      }),
                  ),
                ],
              ),
            ),
            const ListTile(
              leading: Icon(Icons.info_outline_rounded),
              title: Text('Account Information'),
              // onTap: () => Null,
            ),
            const ListTile(
              leading: Icon(Icons.lock_outline),
              title: Text('Password'),
              // onTap: () => Null,
            ),
            const ListTile(
              leading: Icon(Icons.card_travel),
              title: Text('Order'),
              // onTap: () => Null,
            ),
            const ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('My Cards'),
              // onTap: () => Null,
            ),
            const ListTile(
              leading: Icon(FontAwesomeIcons.heart),
              title: Text('Wishlist'),
              // onTap: () => Null,
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              // onTap: () => Null,
            ),
            const SizedBox(
              height: 108.0,
            ),
            ListTile(
              leading: Icon(Icons.output_rounded,
                color: Colors.red[300],
              ),
              title: Text('Logout',
                style: TextStyle(
                  color: Colors.red[300],
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



