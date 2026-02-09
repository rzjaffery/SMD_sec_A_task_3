import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../widgets/navigation/navigation_menu.dart';
import '../widgets/navigation/adaptive_sidebar.dart';
import '../widgets/content/main_content.dart';
import '../widgets/content/content_list_item.dart';

/// Main adaptive layout page
/// Shows drawer in portrait mode and sidebar in landscape mode
class AdaptiveLayoutPage extends StatefulWidget {
  const AdaptiveLayoutPage({super.key});

  @override
  State<AdaptiveLayoutPage> createState() => _AdaptiveLayoutPageState();
}

class _AdaptiveLayoutPageState extends State<AdaptiveLayoutPage> {
  String selectedMenuItem = 'Dashboard';

  late final List<MenuItem> menuItems;
  late final List<ContentListItem> contentItems;

  @override
  void initState() {
    super.initState();

    // Initialize menu items
    menuItems = [
      MenuItem(
        title: 'Dashboard',
        icon: Icons.dashboard,
        onTap: () => _handleMenuItemTap('Dashboard'),
      ),
      MenuItem(
        title: 'Messages',
        icon: Icons.message,
        onTap: () => _handleMenuItemTap('Messages'),
      ),
    ];

    // Initialize content items
    contentItems = List.generate(
      9,
      (index) => ContentListItem(
        title: 'Main Item ${index + 1}',
        subtitle: 'Subtext goes here',
        onTap: () => _handleContentItemTap(index),
      ),
    );
  }

  void _handleMenuItemTap(String itemTitle) {
    setState(() {
      selectedMenuItem = itemTitle;
    });
    print('Selected: $itemTitle');
  }

  void _handleContentItemTap(int index) {
    print('Tapped item: ${index + 1}');
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    // Create the navigation menu
    final navigationMenu = NavigationMenu(
      menuItems: menuItems,
      selectedItem: selectedMenuItem,
      onItemSelected: (item) {
        setState(() {
          selectedMenuItem = item;
        });
        // Close drawer in portrait mode
        if (!isLandscape && Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
    );

    // Create the main content
    final mainContent = MainContent(
      headerTitle: 'Header Content',
      items: contentItems,
    );

    if (isLandscape) {
      // Landscape: Show permanent sidebar
      return Scaffold(
        body: Row(
          children: [
            AdaptiveSidebar(menu: navigationMenu),
            Expanded(child: mainContent),
          ],
        ),
      );
    } else {
      // Portrait: Show drawer
      return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: const Text('Adaptive Layout'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        drawer: Drawer(child: navigationMenu),
        body: mainContent,
      );
    }
  }
}