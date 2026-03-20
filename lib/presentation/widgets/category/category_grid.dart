import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/routes/app_routes.dart';
import '../../../domain/entities/category/category_entity.dart';
import 'category_card.dart';
import 'category_data.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key, required this.categories});

  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return const SizedBox.shrink();
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 14, childAspectRatio: 0.9),
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        final category = categories[index];
        return CategoryCard(
          category: category,
          icon: CategoryData.iconFor(category.name),
          onTap: () {
            Get.toNamed(
              AppRoutes.productList,
              arguments: category,
            );
          },
        );
      },
    );
  }
}
