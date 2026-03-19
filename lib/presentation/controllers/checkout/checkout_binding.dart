import 'package:get/get.dart';
import 'package:grocerx_lite/presentation/controllers/cart/cart_binding.dart';
import 'package:grocerx_lite/presentation/controllers/cart/cart_controller.dart';
import 'package:grocerx_lite/presentation/controllers/profile/profile_binding.dart';
import 'package:grocerx_lite/presentation/controllers/profile/profile_controller.dart';

import 'checkout_controller.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    // Ensure cart and profile controllers are available
    if (!Get.isRegistered<CartController>()) {
      CartBinding().dependencies();
    }
    if (!Get.isRegistered<ProfileController>()) {
      ProfileBinding().dependencies();
    }
    Get.lazyPut(() => CheckoutController(), fenix: true);
  }
}
