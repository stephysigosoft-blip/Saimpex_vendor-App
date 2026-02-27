class RestaurantOrdersModel {
  final bool status;
  final OrdersData? data;
  final MessageModel? message;

  RestaurantOrdersModel({required this.status, this.data, this.message});

  factory RestaurantOrdersModel.fromJson(Map<String, dynamic>? json) {
    return RestaurantOrdersModel(
      status: json?['status'] ?? false,
      data: json?['data'] != null ? OrdersData.fromJson(json?['data']) : null,
      message: json?['message'] != null
          ? MessageModel.fromJson(json?['message'])
          : null,
    );
  }
}

class OrdersData {
  final int currentPage;
  final List<RestaurantOrderItem> data;
  final String? firstPageUrl;
  final int from;
  final int lastPage;
  final String? lastPageUrl;
  final List<LinkModel> links;
  final String? nextPageUrl;
  final String? path;
  final int perPage;
  final String? prevPageUrl;
  final int to;
  final int total;

  OrdersData({
    required this.currentPage,
    required this.data,
    this.firstPageUrl,
    required this.from,
    required this.lastPage,
    this.lastPageUrl,
    required this.links,
    this.nextPageUrl,
    this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory OrdersData.fromJson(Map<String, dynamic>? json) {
    return OrdersData(
      currentPage: json?['current_page'] ?? 0,
      data:
          (json?['data'] as List<dynamic>?)
              ?.map((e) => RestaurantOrderItem.fromJson(e))
              .toList() ??
          [],
      firstPageUrl: json?['first_page_url'],
      from: json?['from'] ?? 0,
      lastPage: json?['last_page'] ?? 0,
      lastPageUrl: json?['last_page_url'],
      links:
          (json?['links'] as List<dynamic>?)
              ?.map((e) => LinkModel.fromJson(e))
              .toList() ??
          [],
      nextPageUrl: json?['next_page_url'],
      path: json?['path'],
      perPage: json?['per_page'] ?? 0,
      prevPageUrl: json?['prev_page_url'],
      to: json?['to'] ?? 0,
      total: json?['total'] ?? 0,
    );
  }
}

class RestaurantOrderItem {
  final int orderId;
  final String orderCode;
  final int status;
  final String statusText;
  final String vendorName;
  final String vendorImage;
  final int itemTotal;
  final int itemsCount;
  final List<OrderProduct> products;
  final String orderedAt;
  final DriverModel? driver;

  RestaurantOrderItem({
    required this.orderId,
    required this.orderCode,
    required this.status,
    required this.statusText,
    required this.vendorName,
    required this.vendorImage,
    required this.itemTotal,
    required this.itemsCount,
    required this.products,
    required this.orderedAt,
    this.driver,
  });

  factory RestaurantOrderItem.fromJson(Map<String, dynamic>? json) {
    return RestaurantOrderItem(
      orderId: json?['order_id'] ?? 0,
      orderCode: json?['order_code'] ?? '',
      status: json?['status'] ?? 0,
      statusText: json?['status_text'] ?? '',
      vendorName: json?['vendor_name'] ?? '',
      vendorImage: json?['vendor_image'] ?? '',
      itemTotal: json?['item_total'] ?? 0,
      itemsCount: json?['items_count'] ?? 0,
      products:
          (json?['products'] as List<dynamic>?)
              ?.map((e) => OrderProduct.fromJson(e))
              .toList() ??
          [],
      orderedAt: json?['ordered_at'] ?? '',
      driver: json?['driver'] != null
          ? DriverModel.fromJson(json?['driver'])
          : null,
    );
  }
}

class OrderProduct {
  final String name;
  final String image;
  final int price;
  final int discountPrice;
  final int quantity;

  OrderProduct({
    required this.name,
    required this.image,
    required this.price,
    required this.discountPrice,
    required this.quantity,
  });

  factory OrderProduct.fromJson(Map<String, dynamic>? json) {
    return OrderProduct(
      name: json?['name'] ?? '',
      image: json?['image'] ?? '',
      price: json?['price'] ?? 0,
      discountPrice: json?['discount_price'] ?? 0,
      quantity: json?['quantity'] ?? 0,
    );
  }
}

class DriverModel {
  final int id;
  final String name;
  final String phone;
  final String image;
  final int rating;
  final int reviews;

  DriverModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.image,
    required this.rating,
    required this.reviews,
  });

  factory DriverModel.fromJson(Map<String, dynamic>? json) {
    return DriverModel(
      id: json?['id'] ?? 0,
      name: json?['name'] ?? '',
      phone: json?['phone'] ?? '',
      image: json?['image'] ?? '',
      rating: json?['rating'] ?? 0,
      reviews: json?['reviews'] ?? 0,
    );
  }
}

class LinkModel {
  final String? url;
  final String label;
  final bool active;

  LinkModel({this.url, required this.label, required this.active});

  factory LinkModel.fromJson(Map<String, dynamic>? json) {
    return LinkModel(
      url: json?['url'],
      label: json?['label'] ?? '',
      active: json?['active'] ?? false,
    );
  }
}

class MessageModel {
  final List<String> messageEn;
  final List<String> messageFr;
  final List<String> messageAr;

  MessageModel({
    required this.messageEn,
    required this.messageFr,
    required this.messageAr,
  });

  factory MessageModel.fromJson(Map<String, dynamic>? json) {
    return MessageModel(
      messageEn: (json?['message_en'] as List<dynamic>?)?.cast<String>() ?? [],
      messageFr: (json?['message_fr'] as List<dynamic>?)?.cast<String>() ?? [],
      messageAr: (json?['message_ar'] as List<dynamic>?)?.cast<String>() ?? [],
    );
  }
}
