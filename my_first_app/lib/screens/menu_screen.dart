import 'package:flutter/material.dart';

import '../data/menu_data.dart';
import '../widgets/category_sidebar.dart';
import '../widgets/food_card.dart';

class MenuScreen extends StatefulWidget {
  final VoidCallback onLogout; // runs when the user taps "Log out"

  const MenuScreen({super.key, required this.onLogout});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String selectedCategory = "Burgers";

  // Used by the AnimatedOpacity below: 1 = fully visible, 0 = invisible.
  double contentOpacity = 1;

  // Runs when the user taps a category in the sidebar.
  void selectCategory(String category) {
    // Tapping the category that is already selected does nothing.
    if (category == selectedCategory) return;

    // Step 1: switch the category and make the content invisible.
    setState(() {
      selectedCategory = category;
      contentOpacity = 0;
    });

    // Step 2: right after this frame is drawn, fade the content back in.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          contentOpacity = 1;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        title: const Text("🍔  Food House"),
        actions: [
          // The 3-line menu button at the top right
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu),
            itemBuilder: (context) => const [
              PopupMenuItem(value: "Home", child: Text("Home")),
              PopupMenuItem(value: "About", child: Text("About")),
              PopupMenuItem(value: "Contact", child: Text("Contact")),
              PopupMenuItem(value: "Logout", child: Text("Log out")),
            ],
            onSelected: (value) {
              // Only "Logout" does something for now.
              if (value == "Logout") {
                widget.onLogout();
              }
            },
          ),
        ],
      ),
      body: Row(
        children: [
          // Left side: category list
          CategorySidebar(
            selectedCategory: selectedCategory,
            onSelected: selectCategory,
          ),

          // Right side: dishes of the selected category
          Expanded(
            // ANIMATION 3: AnimatedOpacity
            // Fades the dishes in whenever the category changes.
            child: AnimatedOpacity(
              opacity: contentOpacity,
              duration: const Duration(milliseconds: 900),
              curve: Curves.easeInOut,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text(
                    selectedCategory,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // "!" tells Dart this category definitely exists in the menu.
                  for (final item in menu[selectedCategory]!)
                    FoodCard(item: item),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
