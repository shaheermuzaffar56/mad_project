import 'package:flutter/material.dart';

// ANIMATION 2: AnimatedContainer
// One category button in the sidebar. When it is selected, its color,
// padding and icon size change smoothly instead of jumping.
class AnimatedCategoryTile extends StatelessWidget {
  final String category;
  final IconData? icon; // the "?" means it is allowed to be empty (null)
  final bool isSelected;
  final VoidCallback onTap; // a function that takes no inputs

  const AnimatedCategoryTile({
    super.key,
    required this.category,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      // Selected tile gets a little more padding.
      padding: EdgeInsets.symmetric(
        horizontal: isSelected ? 14 : 12,
        vertical: isSelected ? 15 : 11,
      ),
      decoration: BoxDecoration(
        color: isSelected ? colors.primaryContainer : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Row(
          children: [
            Icon(
              icon,
              size: isSelected ? 22 : 20,
              color: isSelected ? colors.onPrimaryContainer : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                category,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? colors.onPrimaryContainer : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
