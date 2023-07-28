import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return GNav(
      backgroundColor: Colors.white,
      color: Colors.grey[400],
      activeColor: Colors.black,
      padding: const EdgeInsets.all(16.0),
      tabs: const [
        GButton(
          icon: Icons.home,
          text: 'Home',
        ),
        GButton(
          icon: Icons.favorite_border,
          text: 'Likes',
        ),
        GButton(
          icon: Icons.card_travel,
          text: 'Cart',
        ),
        GButton(
          icon: Icons.account_balance_wallet,
          text: 'Wallet',
        ),
      ],
    );
  }
}
