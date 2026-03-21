import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/product_detail_controller.dart';

class ProductDetailHeader extends GetView<ProductDetailController> {
  const ProductDetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Obx(() {
      final product = controller.currentProduct;

      return Row(
        children: <Widget>[
          Expanded(
            child: Text(
              controller.name.value,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600, fontSize: 16, color: theme.colorScheme.onSurface),
            ),
          ),
          IconButton(
            icon: Icon(Icons.favorite_border, color: theme.colorScheme.onSurface.withValues(alpha: 0.6)),
            onPressed: () {
              Get.snackbar(
                'Wishlist',
                '${product.name} added to Wishlist (Lite Version)',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: theme.colorScheme.primaryContainer,
                colorText: theme.colorScheme.onPrimaryContainer,
                margin: const EdgeInsets.all(16),
                borderRadius: 12,
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.share_outlined, color: theme.colorScheme.onSurface),
            onPressed: () {},
          ),
        ],
      );
    });
  }
}
