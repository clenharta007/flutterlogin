import 'package:flutter/material.dart';

class Validators {
  static String? validateEmail(String? value) {
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final max = 255;
    if (value.length > max) {
      return 'Must not exceed $max characters';
    }
    // Basic email pattern validation
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    final max = 15;
    if (value.length > max) {
      return 'Must not exceed $max characters';
    }
    // Allow only digits with length between 10 and 15
    final phoneRegex = RegExp(r'^\d{10,15}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid phone number (10-15 digits)';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'username is required';
    }
    final max = 255;
    if (value.length > max) {
      return 'Must not exceed $max characters';
    }
    return null;
  }

  static String? validatePass(String? value) {
    if (value == null || value.isEmpty) {
      return 'username is required';
    }
    final min = 8;
    if (value.length < min) {
      return 'Must be at least $min characters';
    }
    return null;
  }

  static IconData mapIcon(String iconName) {
    switch (iconName) {
      case "home":
        return Icons.home;
      case "star":
        return Icons.star;
      case "settings":
        return Icons.settings;
      case "person":
        return Icons.person;
      default:
        return Icons.help; // Default icon for unknown names
    }
  }
}
