import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/cart/cart_controller.dart';
import '../../widgets/cart/cart_item_card.dart';
import '../../widgets/cart/cart_total_card.dart';
import '../../widgets/cart/checkout_button.dart';
import '../../widgets/common/grocer_app_bar.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: GrocerAppBar(
        title: Text(
          'Cart (${controller.totalItems})',
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: theme.colorScheme.onSurface),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: controller.cartItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: CartItemCard(cartItem: controller.cartItems[index]),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                boxShadow: [BoxShadow(color: Colors.black12.withValues(alpha: 0.08), blurRadius: 18, spreadRadius: 2, offset: const Offset(0, -8))],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [CartTotalCard(), SizedBox(height: 16), CheckoutButton()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
