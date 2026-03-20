import 'package:get/get.dart';

import '../../../domain/entities/category/category_entity.dart';
import '../../../domain/entities/product/product_entity.dart';

/// Product controller for Product module UI.
class ProductController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<ProductEntity> products = <ProductEntity>[].obs;
  final RxString errorMessage = ''.obs;

  /// Title to show in the Product listing AppBar.
  final RxString pageTitle = 'Products'.obs;

  /// Currently selected sort label (e.g. "Relevance", "Price: Low to High").
  final RxString selectedSort = 'Relevance'.obs;

  /// Currently selected category filter.
  final RxString selectedCategory = 'All'.obs;

  /// When navigating from a category, we keep the raw category id so we can match by id too.
  String? _requestedCategoryId;

  /// Filtered list of products to be rendered in the grid.
  final RxList<ProductEntity> filteredProductList = <ProductEntity>[].obs;

  /// Image banners for the product header carousel.
  final RxList<String> productImages = <String>[].obs;

  /// Unique category labels for filters.
  final RxList<String> uniqueCategories = <String>[].obs;

  /// Internal mapping from product id to category label (for demo filters).
  final Map<String, String> _productCategory = <String, String>{};

  /// Internal mapping from product id to category id (for demo filters).
  final Map<String, String> _productCategoryId = <String, String>{};

  @override
  void onInit() {
    super.onInit();
    final Object? args = Get.arguments;
    if (args is CategoryEntity) {
      _requestedCategoryId = args.id;
      selectedCategory.value = args.name;
      pageTitle.value = args.name;
    }
    _loadDemoProducts();
  }

  void _loadDemoProducts() {
    final List<ProductEntity> demoProducts = <ProductEntity>[
      const ProductEntity(id: 'p1', name: 'Fresh Tomatoes 1kg', image: 'assets/images/tomato.png', price: 45, mrp: 60, description: 'Juicy red tomatoes perfect for salads and curries.', inStock: true),
      const ProductEntity(id: 'p2', name: 'Premium Potatoes 2kg', image: 'assets/images/potato.png', price: 70, mrp: 90, description: 'Clean, starchy potatoes ideal for fries and mash.', inStock: true),
      const ProductEntity(id: 'p3', name: 'Organic Carrots 500g', image: 'assets/images/carrot.png', price: 35, mrp: 45, description: 'Crunchy carrots great for snacking and juicing.', inStock: true),
      const ProductEntity(id: 'p4', name: 'Green Spinach Bunch', image: 'assets/images/spinach.png', price: 30, mrp: 40, description: 'Leafy spinach rich in iron and vitamins.', inStock: true),
      const ProductEntity(id: 'p5', name: 'Mixed Bell Peppers 500g', image: 'assets/images/pepper.png', price: 80, mrp: 100, description: 'Colourful peppers perfect for stir-fries and salads.', inStock: true),
    ];

    // Map demo products to categories.
    _productCategory
      ..clear()
      ..addAll(<String, String>{'p1': 'Vegetables', 'p2': 'Vegetables', 'p3': 'Vegetables', 'p4': 'Leafy Greens', 'p5': 'Vegetables'});

    // Map demo products to category ids (best-effort for template filtering).
    // This is aligned with the category ids used in CategoryData (c1..c6).
    _productCategoryId
      ..clear()
      ..addAll(<String, String>{
        'p1': 'c2',
        'p2': 'c2',
        'p3': 'c2',
        // The demo product controller uses a special label for spinach; we map it to Vegetables id.
        'p4': 'c2',
        'p5': 'c2',
      });

    products.assignAll(demoProducts);

    // Derive unique categories including "All".
    final Set<String> categories = _productCategory.values.toSet();
    uniqueCategories.assignAll(<String>['All', ...categories]);

    // Header / banner images.
    productImages.assignAll(<String>['assets/images/tomato.png', 'assets/images/potato.png', 'assets/images/carrot.png']);

    _applyFilters();
  }

  /// Cycle sort option and apply filter.
  void applyFilter() {
    const List<String> options = <String>['Relevance', 'Price: Low to High', 'Price: High to Low', 'Discount'];

    final int currentIndex = options.indexOf(selectedSort.value);
    final int nextIndex = currentIndex == -1 ? 0 : (currentIndex + 1) % options.length;
    selectedSort.value = options[nextIndex];

    _applyFilters();
  }

  /// Cycle through available categories and apply category filter.
  void applyCategoryFilter() {
    if (uniqueCategories.isEmpty) {
      return;
    }

    // User-driven filter changes should not keep using the originally requested category id.
    _requestedCategoryId = null;

    final int currentIndex = uniqueCategories.indexOf(selectedCategory.value);
    final int nextIndex = currentIndex == -1 ? 0 : (currentIndex + 1) % uniqueCategories.length;

    selectedCategory.value = uniqueCategories[nextIndex];
    _applyFilters();
  }

  void _applyFilters() {
    List<ProductEntity> list = List<ProductEntity>.from(products);

    // Category filter
    final String categoryName = selectedCategory.value;
    if (categoryName != 'All' && categoryName.isNotEmpty) {
      list = list.where((ProductEntity p) {
        final bool matchesName = _productCategory[p.id] == categoryName;
        final bool matchesId = _requestedCategoryId != null ? _productCategoryId[p.id] == _requestedCategoryId : false;
        return matchesName || matchesId;
      }).toList();
    }

    // Sort filter
    switch (selectedSort.value) {
      case 'Price: Low to High':
        list.sort((ProductEntity a, ProductEntity b) => a.price.compareTo(b.price));
        break;
      case 'Price: High to Low':
        list.sort((ProductEntity a, ProductEntity b) => b.price.compareTo(a.price));
        break;
      case 'Discount':
        double discount(ProductEntity p) {
          final double? mrp = p.mrp;
          if (mrp == null || mrp <= 0 || mrp <= p.price) {
            return 0;
          }
          return (mrp - p.price) / mrp;
        }

        list.sort((ProductEntity a, ProductEntity b) => discount(b).compareTo(discount(a)));
        break;
      case 'Relevance':
      default:
        break;
    }

    filteredProductList.assignAll(list);
  }
}
