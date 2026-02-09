import 'package:flutter/material.dart';
import '../../models/menu_item.dart';
import 'menu_header.dart';
import 'menu_item_tile.dart';


class NavigationMenu extends StatelessWidget {
  final List<MenuItem> menuItems;
  final String selectedItem;
  final Function(String) onItemSelected;
  final bool showCloseButton;

  const NavigationMenu({
    super.key,
    required this.menuItems,
    required this.selectedItem,
    required this.onItemSelected,
    this.showCloseButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Menu Header
        MenuHeader(showCloseButton: showCloseButton),
        const Divider(height: 1),
        // Menu Items List
        ...menuItems.map(
          (item) => MenuItemTile(
            item: item,
            isSelected: selectedItem == item.title,
            onTap: () {
              onItemSelected(item.title);
              item.onTap?.call();
            },
          ),
        ),
      ],
    );
  }
}