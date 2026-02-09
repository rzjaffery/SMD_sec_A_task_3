import 'package:flutter/material.dart';

/// Header widget with logo and title
/// Displays at the top of the main content area
class AppHeader extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Widget? leading;

  const AppHeader({
    super.key,
    required this.title,
    this.backgroundColor = const Color(0xFF2196F3),
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Row(
        children: [
          leading ??
              const FlutterLogo(
                size: 60,
                textColor: Colors.white,
              ),
          const SizedBox(width: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}