class RestaurantAllCategoriesModel {
  String? status;
  List<RestaurantCategoryData>? data;
  String? message;

  RestaurantAllCategoriesModel({
    this.status,
    this.data,
    this.message,
  });

  RestaurantAllCategoriesModel.fromJson(Map<String, dynamic>? json) {
    status = json?['status']?.toString();
    message = json?['message']?.toString();

    if (json?['data'] != null) {
      data = <RestaurantCategoryData>[];
      json?['data']?.forEach((v) {
        data?.add(RestaurantCategoryData.fromJson(v));
      });
    } else {
      data = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = <String, dynamic>{};

    dataMap['status'] = status;
    dataMap['message'] = message;

    if (data != null) {
      dataMap['data'] = data?.map((v) => v.toJson()).toList();
    } else {
      dataMap['data'] = [];
    }

    return dataMap;
  }
}

class RestaurantCategoryData {
  int? id;
  String? nameEn;
  String? nameAr;
  String? nameFr;
  String? image;

  RestaurantCategoryData({
    this.id,
    this.nameEn,
    this.nameAr,
    this.nameFr,
    this.image,
  });

  RestaurantCategoryData.fromJson(Map<String, dynamic>? json) {
    final rawId = json?['id'];
    id = rawId is int ? rawId : int.tryParse(rawId?.toString() ?? "0");
    nameEn = json?['name_en']?.toString() ?? "";
    nameAr = json?['name_ar']?.toString() ?? "";
    nameFr = json?['name_fr']?.toString() ?? "";
    image = json?['image']?.toString() ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = <String, dynamic>{};

    dataMap['id'] = id;
    dataMap['name_en'] = nameEn;
    dataMap['name_ar'] = nameAr;
    dataMap['name_fr'] = nameFr;
    dataMap['image'] = image;

    return dataMap;
  }
}