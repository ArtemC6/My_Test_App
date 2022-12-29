import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

Container bottomNavigationBar() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.black,
      boxShadow: [
        BoxShadow(
          blurRadius: 20,
          color: Colors.black.withOpacity(.1),
        )
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
      child: GNav(
        rippleColor: Colors.black,
        hoverColor: Colors.black,
        gap: 8,
        activeColor: Colors.white.withOpacity(1),
        iconSize: 24,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        duration: const Duration(milliseconds: 450),
        tabBackgroundColor: const Color(0xFFCCC0FD),
        color: Colors.white,
        tabs: const [
          GButton(
            textColor: Colors.black,
            iconActiveColor: Colors.black,
            icon: Icons.settings,
            text: 'Настройки',
          ),
          GButton(
            textColor: Colors.black,
            iconActiveColor: Colors.black,
            icon: Icons.qr_code,
            text: 'Мои коды',
          ),
          GButton(
            textColor: Colors.black,
            iconActiveColor: Colors.black,
            icon: Icons.person,
            text: 'Профиль',
          ),
        ],
        selectedIndex: 1,
        onTabChange: (index) {},
      ),
    ),
  );
}

Scaffold loadingHScreen() {
  return const Scaffold(
    body: Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          color: Colors.black,
          strokeWidth: 0.8,
        ),
      ),
    ),
  );
}
