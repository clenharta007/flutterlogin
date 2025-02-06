import 'package:flutter/material.dart';

class Assetsbank {
  static IconData mapIcon(String iconName) {
    switch (iconName) {
      case "home":
        return Icons.home;
      case "notifications":
        return Icons.notifications;
      case "settings":
        return Icons.settings;
      case "person":
        return Icons.person;
      case "shopping_cart":
        return Icons.shopping_cart;
      case "help":
        return Icons.help;
      default:
        return Icons.help; // Default icon for unknown names
    }
  }
}
