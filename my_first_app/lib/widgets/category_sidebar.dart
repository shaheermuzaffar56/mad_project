import 'package:flutter/material.dart';

import '../animations/animated_category_tile.dart';
import '../data/menu_data.dart';

// The grey list of categories on the left side of the menu screen.
class CategorySidebar extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onSelected; // called with the tapped category name

  const CategorySidebar({
    super.key,
    required this.selectedCategory,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      color: Colors.grey.shade100,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          // Make one tile for every category name in the menu.
          for (final category in menu.keys)
            AnimatedCategoryTile(
              category: category,
              icon: categoryIcons[category],
              isSelected: category == selectedCategory,
              onTap: () {
                onSelected(category);
              },
            ),
        ],
      ),
    );
  }
}
