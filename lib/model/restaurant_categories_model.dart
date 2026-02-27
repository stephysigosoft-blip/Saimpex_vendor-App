class RestaurantCategoriesModel {
  final bool? status;
  final List<CategoryData>? data;
  final MessageModel? message;

  RestaurantCategoriesModel({
    this.status,
    this.data,
    this.message,
  });

  factory RestaurantCategoriesModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return RestaurantCategoriesModel();

    return RestaurantCategoriesModel(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CategoryData.fromJson(e as Map<String, dynamic>?))
          .toList() ??
          [],
      message: MessageModel.fromJson(json['message'] as Map<String, dynamic>?),
    );
  }
}

class CategoryData {
  final int? categoryId;
  final String? nameEn;
  final String? nameAr;
  final String? nameFr;
  final String? image;


  CategoryData({
    this.categoryId,
    this.nameEn,
    this.nameAr,
    this.nameFr,
    this.image,
  });

  factory CategoryData.fromJson(Map<String, dynamic>? json) {
    if (json == null) return CategoryData();

    return CategoryData(
      categoryId: json['category_id'] is int
          ? json['category_id']
          : int.tryParse(json['category_id']?.toString() ?? ""),
      nameEn: json['name_en']?.toString(),
      nameAr: json['name_ar']?.toString(),
      nameFr: json['name_fr']?.toString(),
      image: json['image']?.toString(),
    );
  }
}

class MessageModel {
  final List<String>? messageEn;
  final List<String>? messageFr;
  final List<String>? messageAr;

  MessageModel({
    this.messageEn,
    this.messageFr,
    this.messageAr,
  });

  factory MessageModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return MessageModel();

    return MessageModel(
      messageEn: (json['message_en'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
      messageFr: (json['message_fr'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
      messageAr: (json['message_ar'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
    );
  }
}
