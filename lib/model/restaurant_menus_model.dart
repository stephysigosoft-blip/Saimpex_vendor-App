class RestaurantMenusModel {
  bool? status;
  List<RestaurantMenu>? data;
  String? message;

  RestaurantMenusModel({this.status, this.data, this.message});

  factory RestaurantMenusModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return RestaurantMenusModel();

    return RestaurantMenusModel(
      status: json['status'] == 'true' || json['status'] == true,
      data:
          (json['data'] as List?)
              ?.map((e) => RestaurantMenu.fromJson(e as Map<String, dynamic>?))
              .toList() ??
          [],
      message: json['message']?.toString(),
    );
  }
}

class RestaurantMenu {
  int? id;
  String? nameEn;
  String? nameAr;
  String? nameFr;
  String? categoryId;
  String? image;

  RestaurantMenu({
    this.id,
    this.nameEn,
    this.nameAr,
    this.nameFr,
    this.categoryId,
    this.image,
  });

  factory RestaurantMenu.fromJson(Map<String, dynamic>? json) {
    if (json == null) return RestaurantMenu();

    return RestaurantMenu(
      id: json['id'] as int? ?? 0,
      nameEn: json['name_en']?.toString() ?? '',
      nameAr: json['name_ar']?.toString() ?? '',
      nameFr: json['name_fr']?.toString() ?? '',
      categoryId: json['category_id']?.toString() ?? '',
      image: json['image']?.toString() ?? '',
    );
  }
}
