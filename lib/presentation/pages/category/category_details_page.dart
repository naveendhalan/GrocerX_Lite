import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/category/category_entity.dart';

class CategoryDetailsPage extends StatelessWidget {
  const CategoryDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Object? args = Get.arguments;

    final CategoryEntity? category =
        args is CategoryEntity ? args : null;

    final String title =
        category?.name ?? (args?.toString() ?? 'Category');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Category details for $title',
          style: theme.textTheme.titleMedium,
        ),
      ),
    );
  }
}

