class RestaurantSearchModel {
  bool? status;
  RestaurantSearchData? data;
  Message? message;

  RestaurantSearchModel({this.status, this.data, this.message});

  factory RestaurantSearchModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return RestaurantSearchModel();

    return RestaurantSearchModel(
      status: json["status"] as bool? ?? false,
      data: RestaurantSearchData.fromJson(json["data"] as Map<String, dynamic>?),
      message: Message.fromJson(json["message"] as Map<String, dynamic>?),
    );
  }
}

class RestaurantSearchData {
  RestaurantPagination? restaurants;

  RestaurantSearchData({this.restaurants});

  factory RestaurantSearchData.fromJson(Map<String, dynamic>? json) {
    if (json == null) return RestaurantSearchData();

    return RestaurantSearchData(
      restaurants: RestaurantPagination.fromJson(
        json["restaurants"] as Map<String, dynamic>?,
      ),
    );
  }
}

/// Pagination Wrapper
class RestaurantPagination {
  int? currentPage;
  List<Restaurant>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<PaginationLink>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  RestaurantPagination({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory RestaurantPagination.fromJson(Map<String, dynamic>? json) {
    if (json == null) return RestaurantPagination();

    return RestaurantPagination(
      currentPage: json["current_page"] as int? ?? 0,
      data: (json["data"] as List?)
          ?.map((e) => Restaurant.fromJson(e as Map<String, dynamic>?))
          .toList() ??
          [],
      firstPageUrl: json["first_page_url"]?.toString() ?? "",
      from: json["from"] as int? ?? 0,
      lastPage: json["last_page"] as int? ?? 0,
      lastPageUrl: json["last_page_url"]?.toString() ?? "",
      links: (json["links"] as List?)
          ?.map((e) => PaginationLink.fromJson(e as Map<String, dynamic>?))
          .toList() ??
          [],
      nextPageUrl: json["next_page_url"]?.toString() ?? "",
      path: json["path"]?.toString() ?? "",
      perPage: _parseInt(json["per_page"]),
      prevPageUrl: json["prev_page_url"]?.toString() ?? "",
      to: json["to"] as int? ?? 0,
      total: json["total"] as int? ?? 0,
    );
  }

  static int _parseInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    return int.tryParse(value.toString()) ?? 0;
  }
}

/// Restaurant Model
class Restaurant {
  int? id;
  int? userId;
  String? nameEn;
  String? nameAr;
  String? nameFr;
  String? address;
  String? latitude;
  String? longitude;
  int? restaurantType;
  String? image;
  String? rating;
  int? ratingCount;
  String? avgPreparationMinutes;
  double? distanceKm;
  String? offerPercentage;
  int? isOpen;
  String? openingTime;
  String? closingTime;

  Restaurant({
    this.id,
    this.userId,
    this.nameEn,
    this.nameAr,
    this.nameFr,
    this.address,
    this.latitude,
    this.longitude,
    this.restaurantType,
    this.image,
    this.rating,
    this.ratingCount,
    this.avgPreparationMinutes,
    this.distanceKm,
    this.offerPercentage,
    this.isOpen,
    this.openingTime,
    this.closingTime,
  });

  factory Restaurant.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Restaurant();

    return Restaurant(
      id: json["id"] as int? ?? 0,
      userId: json["user_id"] as int? ?? 0,
      nameEn: json["name_en"]?.toString() ?? "",
      nameAr: json["name_ar"]?.toString() ?? "",
      nameFr: json["name_fr"]?.toString() ?? "",
      address: json["address"]?.toString() ?? "",
      latitude: json["latitude"]?.toString() ?? "",
      longitude: json["longitude"]?.toString() ?? "",
      restaurantType: json["restaurant_type"] as int? ?? 0,
      image: json["image"]?.toString() ?? "",
      rating: json["rating"]?.toString() ?? "0.0",
      ratingCount: json["rating_count"] as int? ?? 0,
      avgPreparationMinutes: json["avg_preparation_minutes"]?.toString() ?? "",
      distanceKm: (json["distance_km"] as num?)?.toDouble() ?? 0.0,
      offerPercentage: json["offer_percentage"]?.toString() ?? "",
      isOpen: json["is_open"] as int? ?? 0,
      openingTime: json["opening_time"]?.toString() ?? "",
      closingTime: json["closing_time"]?.toString() ?? "",
    );
  }
}

/// Pagination Link
class PaginationLink {
  String? url;
  String? label;
  int? page;
  bool? active;

  PaginationLink({this.url, this.label, this.page, this.active});

  factory PaginationLink.fromJson(Map<String, dynamic>? json) {
    if (json == null) return PaginationLink();

    return PaginationLink(
      url: json["url"]?.toString() ?? "",
      label: json["label"]?.toString() ?? "",
      page: json["page"] as int? ?? 0,
      active: json["active"] as bool? ?? false,
    );
  }
}

/// Message model
class Message {
  List<String>? messageEn;
  List<String>? messageFr;
  List<String>? messageAr;

  Message({this.messageEn, this.messageFr, this.messageAr});

  factory Message.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Message();

    return Message(
      messageEn: (json["message_en"] as List?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
      messageFr: (json["message_fr"] as List?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
      messageAr: (json["message_ar"] as List?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
    );
  }
}
