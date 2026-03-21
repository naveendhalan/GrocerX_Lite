import 'package:get/get.dart';

import '../../../domain/entities/cart_item_entity.dart';
import '../../../domain/entities/product/product_entity.dart';

class CartController extends GetxController {
  final RxList<CartItemEntity> cartItems = <CartItemEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadDemoData();
  }

  void _loadDemoData() {
    // Static Lite demo cart items for screenshots.
    cartItems.assignAll([
      CartItemEntity(
        id: '1',
        product: const ProductEntity(
          id: '1',
          name: 'Fresh Bread',
          image: 'assets/images/product1.png',
          price: 40,
          mrp: 40,
          description: 'Fresh red tomatoes',
          inStock: true,
        ),
        quantity: 2,
      ),
      CartItemEntity(
        id: '2',
        product: const ProductEntity(
          id: '2',
          name: 'Peanut Butter',
          image: 'assets/images/product2.png',
          price: 180,
          mrp: 220,
          description: 'Fresh organic carrots',
          inStock: true,
        ),
        quantity: 1,
      ),
    ]);
  }

  // Fixed summary values keep Lite UI deterministic.
  double get subtotal => 260.0;

  double get deliveryFee => 5.0;

  double get total => subtotal + deliveryFee;

  int get totalItems {
    return cartItems.fold(0, (sum, item) => sum + item.quantity);
  }
}
