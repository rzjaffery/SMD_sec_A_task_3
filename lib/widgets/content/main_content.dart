import 'package:flutter/material.dart';
import 'app_header.dart';
import 'content_list_item.dart';

/// Main content area widget
/// Combines the app header with a scrollable list of items
class MainContent extends StatelessWidget {
  final String headerTitle;
  final List<ContentListItem> items;

  const MainContent({
    super.key,
    required this.headerTitle,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Blue header with logo
        AppHeader(title: headerTitle),
        // Scrollable list of content items
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) => items[index],
          ),
        ),
      ],
    );
  }
}