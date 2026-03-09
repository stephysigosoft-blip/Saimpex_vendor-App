class RatingReviewModel {
  final bool? status;
  final RatingReviewData? data;

  RatingReviewModel({this.status, this.data});

  factory RatingReviewModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return RatingReviewModel();

    return RatingReviewModel(
      status: json['status'] == true || json['status']?.toString() == "true",
      data: json['data'] != null
          ? RatingReviewData.fromJson(json['data'] as Map<String, dynamic>?)
          : null,
    );
  }
}

class RatingReviewData {
  final double? rating;
  final int? totalReviews;
  final List<ReviewItem>? reviews;

  RatingReviewData({this.rating, this.totalReviews, this.reviews});

  factory RatingReviewData.fromJson(Map<String, dynamic>? json) {
    if (json == null) return RatingReviewData();

    return RatingReviewData(
      rating: json['rating'] != null
          ? double.tryParse(json['rating'].toString())
          : null,
      totalReviews: json['total_reviews'] != null
          ? int.tryParse(json['total_reviews'].toString())
          : null,
      reviews: json['reviews'] != null
          ? (json['reviews'] as List)
                .map((i) => ReviewItem.fromJson(i))
                .toList()
          : null,
    );
  }
}

class ReviewItem {
  final int? id;
  final String? rating;
  final String? comment;
  final int? orderId;
  final String? createdAt;
  final int? userId;
  final String? username;
  final String? userImage;
  final String? email;
  final String? orderCode;

  ReviewItem({
    this.id,
    this.rating,
    this.comment,
    this.orderId,
    this.createdAt,
    this.userId,
    this.username,
    this.userImage,
    this.email,
    this.orderCode,
  });

  factory ReviewItem.fromJson(Map<String, dynamic>? json) {
    if (json == null) return ReviewItem();

    return ReviewItem(
      id: int.tryParse(json['id']?.toString() ?? ''),
      rating: json['rating']?.toString(),
      comment: json['comment']?.toString(),
      orderId: int.tryParse(json['order_id']?.toString() ?? ''),
      createdAt: json['created_at']?.toString(),
      userId: int.tryParse(json['user_id']?.toString() ?? ''),
      username: json['username']?.toString(),
      userImage: json['user_image']?.toString(),
      email: json['email']?.toString(),
      orderCode: json['order_code']?.toString(),
    );
  }
}
