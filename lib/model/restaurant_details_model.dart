class RestaurantDetailsModel {
  bool? status;
  RestaurantDetailsData? data;
  Message? message;

  RestaurantDetailsModel({this.status, this.data, this.message});

  factory RestaurantDetailsModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return RestaurantDetailsModel();

    return RestaurantDetailsModel(
      status: json['status'] as bool? ?? false,
      data: json['data'] is Map<String, dynamic>
          ? RestaurantDetailsData.fromJson(
          json['data'] as Map<String, dynamic>?)
          : null,
      message:
      Message.fromJson(json['message'] as Map<String, dynamic>?),
    );
  }
}
class RestaurantDetailsData {
  int? restaurantId;
  String? nameEn;
  String? nameAr;
  String? nameFr;
  String? address;
  double? rating;
  int? ratingCount;
  int? preparationTime;
  int? offerPercentage;
  num? distanceKm;
  String? latitude;
  String? longitude;

  RestaurantDetailsData({
    this.restaurantId,
    this.nameEn,
    this.nameAr,
    this.nameFr,
    this.address,
    this.rating,
    this.ratingCount,
    this.preparationTime,
    this.offerPercentage,
    this.distanceKm,
    this.latitude,
    this.longitude,
  });

  factory RestaurantDetailsData.fromJson(
      Map<String, dynamic>? json) {
    if (json == null) return RestaurantDetailsData();

    return RestaurantDetailsData(
      restaurantId: json['restaurant_id'] as int? ?? 0,
      nameEn: json['name_en']?.toString() ?? '',
      nameAr: json['name_ar']?.toString() ?? '',
      nameFr: json['name_fr']?.toString() ?? '',
      address: json['address']?.toString() ?? '',
      rating: _toDouble(json['rating']),
      ratingCount: json['rating_count'] as int? ?? 0,
      preparationTime: json['preparation_time'] as int? ?? 0,
      offerPercentage: json['offer_percentage'] as int? ?? 0,
      distanceKm: _toNum(json['distance_km']),
      latitude: json['latitude']?.toString() ?? '',
      longitude: json['longitude']?.toString() ?? '',
    );
  }

  static double _toDouble(dynamic v) =>
      v is double ? v : double.tryParse(v?.toString() ?? '') ?? 0.0;

  static num _toNum(dynamic v) =>
      v is num ? v : num.tryParse(v?.toString() ?? '') ?? 0;
}
class Message {
  List<String>? messageEn;
  List<String>? messageFr;
  List<String>? messageAr;

  Message({this.messageEn, this.messageFr, this.messageAr});

  factory Message.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Message();

    return Message(
      messageEn: (json['message_en'] as List?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
      messageFr: (json['message_fr'] as List?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
      messageAr: (json['message_ar'] as List?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
    );
  }
}
