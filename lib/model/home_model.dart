class HomeModel {
  bool? status;
  HomeData? data;
  HomeMessage? message;

  HomeModel({this.status, this.data, this.message});

  factory HomeModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return HomeModel();

    return HomeModel(
      status: json["status"] as bool?,
      data: json["data"] is Map<String, dynamic>
          ? HomeData.fromJson(json["data"])
          : null,
      message: json["message"] is Map<String, dynamic>
          ? HomeMessage.fromJson(json["message"])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status ?? false,
      "data": data?.toJson() ?? {},
      "message": message?.toJson() ?? {},
    };
  }
}

// -----------------------------------------------------

class HomeData {
  List<SliderItem>? sliders;
  RestaurantsData? restaurants;

  HomeData({this.sliders, this.restaurants});

  factory HomeData.fromJson(Map<String, dynamic>? json) {
    if (json == null) return HomeData();

    return HomeData(
      sliders: json["sliders"] is List
          ? (json["sliders"] as List)
          .map((e) => SliderItem.fromJson(e))
          .toList()
          : [],
      restaurants: json["restaurants"] is Map
          ? RestaurantsData.fromJson(json["restaurants"])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "sliders": sliders?.map((e) => e.toJson()).toList() ?? [],
      "restaurants": restaurants?.toJson() ?? {},
    };
  }
}

// -----------------------------------------------------

class SliderItem {
  int? id;
  String? image;
  int? type;
  int? status;
  String? createdAt;
  String? updatedAt;

  SliderItem({
    this.id,
    this.image,
    this.type,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory SliderItem.fromJson(Map<String, dynamic>? json) {
    if (json == null) return SliderItem();

    return SliderItem(
      id: json["id"] as int?,
      image: json["image"]?.toString(),
      type: json["type"] as int?,
      status: json["status"] as int?,
      createdAt: json["created_at"]?.toString(),
      updatedAt: json["updated_at"]?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id ?? 0,
      "image": image ?? "",
      "type": type ?? 0,
      "status": status ?? 0,
      "created_at": createdAt ?? "",
      "updated_at": updatedAt ?? "",
    };
  }
}

// -----------------------------------------------------

class RestaurantsData {
  int? currentPage;
  List<Restaurant>? data;
  dynamic firstPageUrl;
  int? from;
  int? lastPage;
  dynamic lastPageUrl;
  List<PageLink>? links;
  dynamic nextPageUrl;
  dynamic path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  RestaurantsData({
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

  factory RestaurantsData.fromJson(Map<String, dynamic>? json) {
    if (json == null) return RestaurantsData();

    return RestaurantsData(
      currentPage: json["current_page"] as int?,
      data: json["data"] is List
          ? (json["data"] as List)
          .map((e) => Restaurant.fromJson(e))
          .toList()
          : [],
      firstPageUrl: json["first_page_url"]?.toString(),
      from: json["from"] as int?,
      lastPage: json["last_page"] as int?,
      lastPageUrl: json["last_page_url"]?.toString(),
      links: json["links"] is List
          ? (json["links"] as List)
          .map((e) => PageLink.fromJson(e))
          .toList()
          : [],
      nextPageUrl: json["next_page_url"]?.toString(),
      path: json["path"]?.toString(),
      perPage: json["per_page"] as int?,
      prevPageUrl: json["prev_page_url"]?.toString(),
      to: json["to"] as int?,
      total: json["total"] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "current_page": currentPage ?? 0,
      "data": data?.map((e) => e.toJson()).toList() ?? [],
      "first_page_url": firstPageUrl ?? "",
      "from": from ?? 0,
      "last_page": lastPage ?? 0,
      "last_page_url": lastPageUrl ?? "",
      "links": links?.map((e) => e.toJson()).toList() ?? [],
      "next_page_url": nextPageUrl,
      "path": path ?? "",
      "per_page": perPage ?? 0,
      "prev_page_url": prevPageUrl,
      "to": to ?? 0,
      "total": total ?? 0,
    };
  }
}

// -----------------------------------------------------

class Restaurant {
  int? id;
  int? userId;
  String? name_en;
  String? name_fr;
  String? name_ar;
  String? address;
  String? latitude;
  String? longitude;
  int? restaurantType;
  String? image;
  String? rating;
  int? ratingCount;
  String? maxOfferPercentage;
  String? avgPreparationMinutes;
  double? distanceKm;
  int? isOpen;
  String? openingTime;
  String? closingTime;

  Restaurant({
    this.id,
    this.userId,
    this.name_en,
    this.name_ar,
    this.name_fr,
    this.address,
    this.latitude,
    this.longitude,
    this.restaurantType,
    this.image,
    this.rating,
    this.ratingCount,
    this.maxOfferPercentage,
    this.avgPreparationMinutes,
    this.distanceKm,
    this.isOpen,
    this.openingTime,
    this.closingTime,
  });

  factory Restaurant.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Restaurant();

    return Restaurant(
      id: json["id"] as int?,
      userId: json["user_id"] as int?,
      name_ar: json["name_ar"]?.toString(),
      name_en: json["name_en"]?.toString(),
      name_fr: json["name_fr"]?.toString(),
      address: json["address"]?.toString(),
      latitude: json["latitude"]?.toString(),
      longitude: json["longitude"]?.toString(),
      restaurantType: json["restaurant_type"] as int?,
      image: json["image"]?.toString(),
      rating: json["rating"]?.toString(),
      ratingCount: json["rating_count"] as int?,
      maxOfferPercentage: json["max_offer_percentage"]?.toString(),
      avgPreparationMinutes: json["avg_preparation_minutes"]?.toString(),
      distanceKm: (json["distance_km"] as num?)?.toDouble(),
      isOpen: json["is_open"] as int?,
      openingTime: json["opening_time"]?.toString(),
      closingTime: json["closing_time"]?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id ?? 0,
      "user_id": userId ?? 0,
      "name_fr": name_fr ?? "",
      "name_ar": name_ar ?? "",
      "name_en": name_en ?? "",
      "address": address ?? "",
      "latitude": latitude ?? "",
      "longitude": longitude ?? "",
      "restaurant_type": restaurantType ?? 0,
      "image": image ?? "",
      "rating": rating ?? "",
      "rating_count": ratingCount ?? 0,
      "max_offer_percentage": maxOfferPercentage ?? "",
      "avg_preparation_minutes": avgPreparationMinutes ?? "",
      "distance_km": distanceKm ?? 0.0,
      "is_open": isOpen ?? 0,
      "opening_time": openingTime ?? "",
      "closing_time": closingTime ?? "",
    };
  }
}

// -----------------------------------------------------

class PageLink {
  dynamic url;
  dynamic label;
  dynamic page;
  bool? active;

  PageLink({this.url, this.label, this.page, this.active});

  factory PageLink.fromJson(Map<String, dynamic>? json) {
    if (json == null) return PageLink();

    return PageLink(
      url: json["url"]?.toString(),
      label: json["label"]?.toString(),
      page: json["page"] as int?,
      active: json["active"] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "url": url ?? "",
      "label": label ?? "",
      "page": page,
      "active": active ?? false,
    };
  }
}

// -----------------------------------------------------

class HomeMessage {
  List<String>? messageEn;
  List<String>? messageFr;
  List<String>? messageAr;

  HomeMessage({this.messageEn, this.messageFr, this.messageAr});

  factory HomeMessage.fromJson(Map<String, dynamic>? json) {
    if (json == null) return HomeMessage();

    return HomeMessage(
      messageEn:
      (json["message_en"] as List?)?.map((e) => e.toString()).toList() ?? [],
      messageFr:
      (json["message_fr"] as List?)?.map((e) => e.toString()).toList() ?? [],
      messageAr:
      (json["message_ar"] as List?)?.map((e) => e.toString()).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message_en": messageEn ?? [],
      "message_fr": messageFr ?? [],
      "message_ar": messageAr ?? [],
    };
  }
}
