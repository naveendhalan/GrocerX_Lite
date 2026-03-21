import 'package:get/get.dart';

import '../../config/routes/app_routes.dart';
import '../../presentation/controllers/cart/cart_binding.dart';
import '../../presentation/controllers/category/category_binding.dart';
import '../../presentation/controllers/home/home_binding.dart';
import '../../presentation/controllers/notification/notification_binding.dart';
import '../../presentation/controllers/onboarding/onboarding_binding.dart';
import '../../presentation/controllers/product/product_binding.dart';
import '../../presentation/controllers/profile/profile_binding.dart';
import '../../presentation/controllers/review/review_binding.dart';
import '../../presentation/controllers/search/search_binding.dart';
import '../../presentation/controllers/wishlist/wishlist_binding.dart';
import '../../presentation/pages/cart/cart_page.dart';
import '../../presentation/pages/category/category_page.dart';
import '../../presentation/pages/home/home_page.dart';
import '../../presentation/pages/notification/notification_page.dart';
import '../../presentation/pages/onboarding/onboarding_page.dart';
import '../../presentation/pages/product/product_detail_page.dart';
import '../../presentation/pages/product/product_page.dart';
import '../../presentation/pages/profile/profile_page.dart';
import '../../presentation/pages/review/review_flow_page.dart';
import '../../presentation/pages/search/filter_page.dart';
import '../../presentation/pages/search/search_page.dart';
import '../../presentation/pages/splash/splash_page.dart';
import '../../presentation/pages/wishlist/wishlist_page.dart';

class AppRouter {
  static List<GetPage> getPages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashPage()),
    GetPage(name: AppRoutes.onboarding, page: () => const OnboardingPage(), binding: OnboardingBinding()),
    GetPage(name: AppRoutes.home, page: () => const HomePage(), binding: HomeBinding()),
    GetPage(name: AppRoutes.profile, page: () => const ProfilePage(), binding: ProfileBinding()),
    GetPage(name: AppRoutes.cart, page: () => const CartPage(), binding: CartBinding()),
    GetPage(name: AppRoutes.search, page: () => const SearchPage(), binding: SearchBinding()),
    GetPage(name: AppRoutes.filter, page: () => const FilterPage(), binding: SearchBinding()),
    GetPage(name: AppRoutes.productList, page: () => const ProductPage(), binding: ProductBinding()),
    GetPage(name: AppRoutes.productDetail, page: () => const ProductDetailPage(), binding: ProductBinding()),
    GetPage(name: AppRoutes.wishlist, page: () => const WishlistPage(), binding: WishlistBinding()),
    GetPage(name: AppRoutes.notification, page: () => const NotificationPage(), binding: NotificationBinding()),
    GetPage(name: AppRoutes.reviewFlow, page: () => const ReviewFlowPage(), binding: ReviewBinding()),
    GetPage(name: AppRoutes.category, page: () => const CategoryPage(), binding: CategoryBinding()),
  ];
}
