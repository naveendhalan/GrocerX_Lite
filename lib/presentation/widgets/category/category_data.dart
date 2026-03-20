import 'package:flutter/material.dart';

import '../../../domain/entities/category/category_entity.dart';

/// Centralized category configuration used across multiple screens.
class CategoryData {
  static const List<CategoryEntity> categories = <CategoryEntity>[
    CategoryEntity(
      id: 'c1',
      name: 'Fruits',
      image: 'assets/images/fruits.png',
      description: 'Fresh and seasonal fruits for everyday nutrition.',
    ),
    CategoryEntity(
      id: 'c2',
      name: 'Vegetables',
      image: 'assets/images/veg.png',
      description: 'Daily vegetables, leafy greens and more.',
    ),
    CategoryEntity(
      id: 'c3',
      name: 'Dairy',
      image: 'assets/images/dairy.png',
      description: 'Milk, paneer, curd and other dairy products.',
    ),
    CategoryEntity(
      id: 'c4',
      name: 'Snacks',
      image: 'assets/images/snacks.png',
      description: 'Crunchy snacks and quick bites.',
    ),
    CategoryEntity(
      id: 'c5',
      name: 'Bakery',
      image: 'assets/images/bakery.png',
      description: 'Bread, buns, cakes and more.',
    ),
    CategoryEntity(
      id: 'c6',
      name: 'Beverages',
      image: 'assets/images/beverages.png',
      description: 'Juices, soft drinks and refreshing beverages.',
    ),
  ];

  static IconData iconFor(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'fruits':
        return Icons.apple;
      case 'vegetables':
        return Icons.eco;
      case 'dairy':
        return Icons.local_drink;
      case 'snacks':
        return Icons.cookie;
      case 'bakery':
        return Icons.bakery_dining;
      case 'beverages':
        return Icons.local_bar;
      default:
        return Icons.category;
    }
  }
}

