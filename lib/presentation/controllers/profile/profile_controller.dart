import 'package:get/get.dart';

import '../../../config/routes/app_routes.dart';

class ProfileController extends GetxController {
  final RxString name = 'John Doe'.obs;
  final RxString email = 'john.doe@example.com'.obs;
  final RxString phone = '+1 234 567 8900'.obs;
  final RxString profileImage = ''.obs;

  void logout() {
    Get.offAllNamed(AppRoutes.login);
  }
}
