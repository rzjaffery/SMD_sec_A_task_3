import 'package:flutter/material.dart';
import 'navigation_menu.dart';


class AdaptiveSidebar extends StatelessWidget {
  final NavigationMenu menu;
  final double width;

  const AdaptiveSidebar({
    super.key,
    required this.menu,
    this.width = 280,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: menu,
    );
  }
}