import 'package:flutter/material.dart';

import '../models/food_item.dart';

// Category name -> list of dishes in that category.
const Map<String, List<FoodItem>> menu = {
  "Burgers": [
    FoodItem(
      name: "Zinger Burger",
      description: "Crispy chicken burger with cheese and sauce",
      price: "Rs. 450",
      emoji: "🍔",
    ),
    FoodItem(
      name: "Beef Burger",
      description: "Juicy beef patty with fresh vegetables",
      price: "Rs. 500",
      emoji: "🥩",
    ),
  ],
  "Pizza": [
    FoodItem(
      name: "Chicken Pizza",
      description: "Chicken, cheese and special pizza sauce",
      price: "Rs. 900",
      emoji: "🍕",
    ),
    FoodItem(
      name: "Cheese Pizza",
      description: "Extra cheese with delicious pizza sauce",
      price: "Rs. 800",
      emoji: "🧀",
    ),
  ],
  "Drinks": [
    FoodItem(
      name: "Coca Cola",
      description: "Chilled soft drink",
      price: "Rs. 100",
      emoji: "🥤",
    ),
    FoodItem(
      name: "Fresh Juice",
      description: "Freshly prepared fruit juice",
      price: "Rs. 200",
      emoji: "🍹",
    ),
  ],
  "Desserts": [
    FoodItem(
      name: "Ice Cream",
      description: "Cold and creamy vanilla ice cream",
      price: "Rs. 250",
      emoji: "🍦",
    ),
    FoodItem(
      name: "Brownie",
      description: "Warm chocolate brownie",
      price: "Rs. 300",
      emoji: "🍫",
    ),
  ],
};

// Category name -> icon shown in the sidebar.
const Map<String, IconData> categoryIcons = {
  "Burgers": Icons.lunch_dining,
  "Pizza": Icons.local_pizza,
  "Drinks": Icons.local_drink,
  "Desserts": Icons.icecream,
};
