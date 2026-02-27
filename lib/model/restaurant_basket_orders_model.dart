class RestaurantBasketOrdersModel {
  final bool? status;
  final BasketOrderPagination? data;
  final OrderMessage? message;

  RestaurantBasketOrdersModel({this.status, this.data, this.message});

  factory RestaurantBasketOrdersModel.fromJson(Map<String, dynamic>? json) =>
      RestaurantBasketOrdersModel(
        status: json?['status'] ?? false,
        data: BasketOrderPagination.fromJson(json?['data'] as Map<String, dynamic>?),
        message: OrderMessage.fromJson(json?['message'] as Map<String, dynamic>?),
      );
}

class BasketOrderPagination {
  final int? currentPage;
  final List<BasketOrderItem> orders;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<PageLink> links;
  final String? nextPageUrl;
  final String? prevPageUrl;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  BasketOrderPagination({
    this.currentPage,
    required this.orders,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    required this.links,
    this.nextPageUrl,
    this.prevPageUrl,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory BasketOrderPagination.fromJson(Map<String, dynamic>? json) =>
      BasketOrderPagination(
        currentPage: json?['current_page'] ?? 0,
        orders: (json?['data'] as List?)
            ?.map((e) => BasketOrderItem.fromJson(e as Map<String, dynamic>?))
            .toList() ??
            [],
        firstPageUrl: json?['first_page_url']?.toString().trim() ?? '',
        from: json?['from'] ?? 0,
        lastPage: json?['last_page'] ?? 0,
        lastPageUrl: json?['last_page_url']?.toString().trim() ?? '',
        links: (json?['links'] as List?)
            ?.map((e) => PageLink.fromJson(e as Map<String, dynamic>?))
            .toList() ??
            [],
        nextPageUrl: json?['next_page_url']?.toString().trim(),
        prevPageUrl: json?['prev_page_url']?.toString().trim(),
        path: json?['path']?.toString().trim() ?? '',
        perPage: json?['per_page'] ?? 0,
        to: json?['to'] ?? 0,
        total: json?['total'] ?? 0,
      );
}

class BasketOrderItem {
  final int? orderId;
  final int? basketId;
  final String? basketNameEn;
  final String? basketNameAr;
  final String? basketNameFr;
  final int? vendorId;
  final String? vendorName;
  final String? vendorImage;
  final int? basketType;
  final String? basketImage;
  final int? redeemPoints;
  final double? price;
  final dynamic itemsCount;
  final String? purchaseDate;
  final DeliveryLocation? deliveryLocation;
  final String? orderedAt;

  BasketOrderItem({
    this.orderId,
    this.basketId,
    this.basketNameEn,
    this.basketNameAr,
    this.basketNameFr,
    this.vendorId,
    this.vendorName,
    this.vendorImage,
    this.basketType,
    this.basketImage,
    this.redeemPoints,
    this.price,
    this.itemsCount,
    this.purchaseDate,
    this.deliveryLocation,
    this.orderedAt,
  });

  factory BasketOrderItem.fromJson(Map<String, dynamic>? json) =>
      BasketOrderItem(
        orderId: json?['order_id'] ?? 0,
        basketId: json?['basket_id'] ?? 0,
        basketNameEn: json?['basket_name_en']?.toString().trim() ?? '',
        basketNameAr: json?['basket_name_ar']?.toString().trim() ?? '',
        basketNameFr: json?['basket_name_fr']?.toString().trim() ?? '',
        vendorId: json?['vendor_id'] ?? 0,
        vendorName: json?['vendor_name']?.toString().trim() ?? '',
        vendorImage: json?['vendor_image']?.toString().trim() ?? '',
        basketType: json?['basket_type'] ?? 0,
        basketImage: json?['basket_image']?.toString().trim() ?? '',
        redeemPoints: json?['redeem_points'] ?? 0,
        price: _toDouble(json?['price']),
        itemsCount: json?['items_count'] ?? 0,
        purchaseDate: json?['purchase_date']?.toString().trim() ?? '',
        orderedAt: json?['ordered_at']?.toString().trim() ?? '',
        deliveryLocation: DeliveryLocation.fromJson(json?['delivery_location'] as Map<String, dynamic>?),
      );

  static double? _toDouble(dynamic v) =>
      v is double ? v : double.tryParse(v?.toString() ?? '');
}

class DeliveryLocation {
  final String? address;
  final double? latitude;
  final double? longitude;

  DeliveryLocation({this.address, this.latitude, this.longitude});

  factory DeliveryLocation.fromJson(Map<String, dynamic>? json) =>
      DeliveryLocation(
        address: json?['address']?.toString().trim() ?? '',
        latitude: _toDouble(json?['latitude']),
        longitude: _toDouble(json?['longitude']),
      );

  static double? _toDouble(dynamic v) =>
      v is double ? v : double.tryParse(v?.toString() ?? '');
}

class PageLink {
  final String? url;
  final String? label;
  final int? page;
  final bool? active;

  PageLink({this.url, this.label, this.page, this.active});

  factory PageLink.fromJson(Map<String, dynamic>? json) => PageLink(
    url: json?['page']?.toString().trim(),
    label: json?['label']?.toString().trim() ?? '',
    page: _parseNullableInt(json?['page']),
    active: json?['active'] as bool? ?? false,
  );

  static int? _parseNullableInt(dynamic v) {
    if (v == null) return null;
    final s = v.toString().trim();
    if (s.isEmpty || s.toLowerCase() == 'null') return null;
    return int.tryParse(s);
  }
}


class OrderMessage {
  final List<String> messageEn;
  final List<String> messageFr;
  final List<String> messageAr;

  OrderMessage({
    required this.messageEn,
    required this.messageFr,
    required this.messageAr,
  });

  factory OrderMessage.fromJson(Map<String, dynamic>? json) =>
      OrderMessage(
        messageEn: (json?['message_en'] as List?)?.map((e) => e.toString().trim()).toList() ?? [],
        messageFr: (json?['message_fr'] as List?)?.map((e) => e.toString().trim()).toList() ?? [],
        messageAr: (json?['message_ar'] as List?)?.map((e) => e.toString().trim()).toList() ?? [],
      );
}
