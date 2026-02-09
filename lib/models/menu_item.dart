import 'package:flutter/material.dart';

/// Data model for menu items
/// This class holds information about each menu item
class MenuItem {
  final String title;
  final IconData? icon;
  final VoidCallback? onTap;

  MenuItem({
    required this.title,
    this.icon,
    this.onTap,
  });
}