import '../../domain/entities/order_entity.dart';

class OrderItemModel extends OrderItemEntity {
  const OrderItemModel({required super.id, required super.productId, required super.name, required super.image, required super.quantity, required super.price});

  factory OrderItemModel.fromMap(Map<String, dynamic> m) {
    return OrderItemModel(
      id: m['id']?.toString() ?? '',
      productId: m['productId']?.toString() ?? '',
      name: m['name']?.toString() ?? '',
      image: m['image']?.toString() ?? '',
      quantity: (m['quantity'] as num?)?.toInt() ?? 1,
      price: (m['price'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() => {'id': id, 'productId': productId, 'name': name, 'image': image, 'quantity': quantity, 'price': price};
}

class OrderModel extends OrderEntity {
  const OrderModel({
    required super.id,
    required super.status,
    required super.placedAt,
    super.deliveredAt,
    required super.subTotal,
    required super.deliveryFee,
    required super.total,
    required List<OrderItemModel> super.items,
    required super.address,
    super.reviewed,
  });

  factory OrderModel.fromMap(Map<String, dynamic> m) {
    final items = (m['items'] as List<dynamic>? ?? []).map((e) => OrderItemModel.fromMap(Map<String, dynamic>.from(e))).toList();
    return OrderModel(
      id: m['id']?.toString() ?? '',
      status: m['status']?.toString() ?? 'Pending',
      placedAt: DateTime.parse(m['placedAt'] ?? DateTime.now().toIso8601String()),
      deliveredAt: m['deliveredAt'] != null ? DateTime.parse(m['deliveredAt']) : null,
      subTotal: (m['subTotal'] as num?)?.toDouble() ?? 0.0,
      deliveryFee: (m['deliveryFee'] as num?)?.toDouble() ?? 0.0,
      total: (m['total'] as num?)?.toDouble() ?? 0.0,
      items: items,
      address: m['address']?.toString() ?? '',
      reviewed: (m['reviewed'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'status': status,
    'placedAt': placedAt.toIso8601String(),
    'deliveredAt': deliveredAt?.toIso8601String(),
    'subTotal': subTotal,
    'deliveryFee': deliveryFee,
    'total': total,
    'items': items.map((i) => (i as OrderItemModel).toMap()).toList(),
    'address': address,
    'reviewed': reviewed,
  };
}
