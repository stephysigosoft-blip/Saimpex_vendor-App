class RestaurantMenuDetailsModel {
  final bool status;
  final RestaurantMenuDetailsData? data;
  final String message;

  RestaurantMenuDetailsModel({
    required this.status,
    this.data,
    required this.message,
  });

  factory RestaurantMenuDetailsModel.fromJson(Map<String, dynamic> json) {
    return RestaurantMenuDetailsModel(
      status: json['status']?.toString() == "true",
      data: json['data'] != null
          ? RestaurantMenuDetailsData.fromJson(json['data'])
          : null,
      message: json['message'] ?? "",
    );
  }
}

class RestaurantMenuDetailsData {
  final RestaurantMenu? restaurantMenu;
  final int totalOrders;
  final int totalRevenue;
  final int averageRating;
  final int totalRatingCount;
  final List<dynamic> orderDetails;

  RestaurantMenuDetailsData({
    this.restaurantMenu,
    required this.totalOrders,
    required this.totalRevenue,
    required this.averageRating,
    required this.totalRatingCount,
    required this.orderDetails,
  });

  factory RestaurantMenuDetailsData.fromJson(Map<String, dynamic> json) {
    return RestaurantMenuDetailsData(
      restaurantMenu: json['restaurant_menu'] != null
          ? RestaurantMenu.fromJson(json['restaurant_menu'])
          : null,
      totalOrders: json['total_orders'] ?? 0,
      totalRevenue: json['total_revenue'] ?? 0,
      averageRating: json['average_rating'] ?? 0,
      totalRatingCount: json['total_rating_count'] ?? 0,
      orderDetails: json['order_details'] ?? [],
    );
  }
}

class RestaurantMenu {
  final int id;
  final String categoryId;
  final int restaurantId;
  final String nameEn;
  final String nameAr;
  final String nameFr;
  final String descriptionEn;
  final String descriptionAr;
  final String descriptionFr;
  final String image;
  final int isVeg;
  final int approvalStatus;
  final String? deletedAt;
  final String createdAt;
  final String updatedAt;
  final String categoryNameEn;
  final String categoryNameAr;
  final String categoryNameFr;
  final List<Category> categories;

  RestaurantMenu({
    required this.id,
    required this.categoryId,
    required this.restaurantId,
    required this.nameEn,
    required this.nameAr,
    required this.nameFr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.descriptionFr,
    required this.image,
    required this.isVeg,
    required this.approvalStatus,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryNameEn,
    required this.categoryNameAr,
    required this.categoryNameFr,
    required this.categories,
  });

  factory RestaurantMenu.fromJson(Map<String, dynamic> json) {
    return RestaurantMenu(
      id: json['id'] ?? 0,
      categoryId: json['category_id'] ?? "",
      restaurantId: json['restaurant_id'] ?? 0,
      nameEn: json['name_en'] ?? "",
      nameAr: json['name_ar'] ?? "",
      nameFr: json['name_fr'] ?? "",
      descriptionEn: json['description_en'] ?? "",
      descriptionAr: json['description_ar'] ?? "",
      descriptionFr: json['description_fr'] ?? "",
      image: json['image'] ?? "",
      isVeg: json['is_veg'] ?? 0,
      approvalStatus: json['approval_status'] ?? 0,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] ?? "",
      updatedAt: json['updated_at'] ?? "",
      categoryNameEn: json['category_name_en'] ?? "",
      categoryNameAr: json['category_name_ar'] ?? "",
      categoryNameFr: json['category_name_fr'] ?? "",
      categories: (json['categories'] as List?)
              ?.map((e) => Category.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class Category {
  final int id;
  final String nameEn;
  final String nameAr;
  final String nameFr;
  final String image;
  final int status;
  final String? deletedAt;
  final String createdAt;
  final String updatedAt;

  Category({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.nameFr,
    required this.image,
    required this.status,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      nameEn: json['name_en'] ?? "",
      nameAr: json['name_ar'] ?? "",
      nameFr: json['name_fr'] ?? "",
      image: json['image'] ?? "",
      status: json['status'] ?? 0,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] ?? "",
      updatedAt: json['updated_at'] ?? "",
    );
  }
}