class ProfileModel {
  final bool? status;
  final ProfileData? data;
  final ProfileMessage? message;
  final List<LeaveData>? upcomingLeaves;
  final List<LeaveData>? leaveHistory;

  ProfileModel({
    this.status,
    this.data,
    this.message,
    this.upcomingLeaves,
    this.leaveHistory,
  });

  factory ProfileModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return ProfileModel();

    return ProfileModel(
      status: json['status'] == true || json['status']?.toString() == "true",
      data: json['data'] != null
          ? ProfileData.fromJson(
              (json['data']['vendor'] as Map<String, dynamic>?) ??
                  json['data'] as Map<String, dynamic>?,
            )
          : null,
      message: json['message'] != null
          ? ProfileMessage.fromJson(json['message'] as Map<String, dynamic>?)
          : null,
      upcomingLeaves: json['data']?['upcoming_leaves'] != null
          ? (json['data']['upcoming_leaves'] as List)
                .map((i) => LeaveData.fromJson(i))
                .toList()
          : null,
      leaveHistory: json['data']?['leave_history'] != null
          ? (json['data']['leave_history'] as List)
                .map((i) => LeaveData.fromJson(i))
                .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data?.toJson(),
      'message': message?.toJson(),
    };
  }
}

class ProfileData {
  final int? id;
  final String? name;
  final String? countryCode;
  final String? mobile;
  final String? image;
  final String? facebookUrl;
  final String? instagramUrl;
  final String? twitterUrl;
  final String? whatsappUrl;
  final bool? hasBasketOrders;
  final String? email;
  final String? address;
  final String? owner;
  final String? status;
  final String? rating;
  // Bank details
  final String? accountHolderName;
  final String? accountNumber;
  final String? ifscCode;
  final String? upiId;
  final String? bankName;
  // Registration details
  final String? registrationNumber;
  final String? registrationDate;
  final String? gstNo;
  // Payment details
  final String? commissionPercentage;
  final String? totalProfit;
  // Images
  final String? ownerIdProof;
  final String? certificate;
  // Restaurant type
  final int? restaurantType;

  ProfileData({
    this.id,
    this.name,
    this.countryCode,
    this.mobile,
    this.image,
    this.facebookUrl,
    this.instagramUrl,
    this.twitterUrl,
    this.whatsappUrl,
    this.hasBasketOrders,
    this.email,
    this.address,
    this.owner,
    this.status,
    this.rating,
    this.accountHolderName,
    this.accountNumber,
    this.ifscCode,
    this.upiId,
    this.bankName,
    this.registrationNumber,
    this.registrationDate,
    this.gstNo,
    this.commissionPercentage,
    this.totalProfit,
    this.ownerIdProof,
    this.certificate,
    this.restaurantType,
  });

  factory ProfileData.fromJson(Map<String, dynamic>? json) {
    if (json == null) return ProfileData();

    return ProfileData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      countryCode: json['country_code'] as String?,
      mobile: json['mobile'] as String?,
      image: json['image'] as String?,
      facebookUrl: json['facebook_url'] as String?,
      instagramUrl: json['instagram_url'] as String?,
      twitterUrl: json['twitter_url'] as String?,
      whatsappUrl: json['whatsapp_url'] as String?,
      hasBasketOrders: json['has_basket_orders'] as bool?,
      email: json['email']?.toString(),
      address: json['address']?.toString(),
      owner: json['owner_name']?.toString() ?? json['owner']?.toString(),
      status: json['status']?.toString() == '1'
          ? 'ACTIVE'
          : (json['status']?.toString() == '0'
                ? 'INACTIVE'
                : json['status']?.toString()),
      rating: json['rating']?.toString(),
      accountHolderName: json['account_holder_name']?.toString(),
      accountNumber: json['account_number']?.toString(),
      ifscCode: json['ifsc_code']?.toString(),
      upiId: json['upi_id']?.toString(),
      bankName: json['bank_name']?.toString(),
      registrationNumber: json['registration_number']?.toString(),
      registrationDate: json['registration_date']?.toString(),
      gstNo: json['gst_no']?.toString(),
      commissionPercentage: json['commission_percentage']?.toString(),
      totalProfit: json['total_profit']?.toString(),
      ownerIdProof: json['owner_id_proof']?.toString(),
      certificate: json['certificate']?.toString(),
      restaurantType: json['restaurant_type'] != null
          ? int.tryParse(json['restaurant_type'].toString())
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'country_code': countryCode,
      'mobile': mobile,
      'image': image,
      'rating': rating,
    };
  }
}

class ProfileMessage {
  final List<String>? messageEn;
  final List<String>? messageFr;
  final List<String>? messageAr;

  ProfileMessage({this.messageEn, this.messageFr, this.messageAr});

  factory ProfileMessage.fromJson(Map<String, dynamic>? json) {
    if (json == null) return ProfileMessage();

    return ProfileMessage(
      messageEn: (json['message_en'] as List?)
          ?.map((e) => e?.toString() ?? '')
          .toList(),
      messageFr: (json['message_fr'] as List?)
          ?.map((e) => e?.toString() ?? '')
          .toList(),
      messageAr: (json['message_ar'] as List?)
          ?.map((e) => e?.toString() ?? '')
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message_en': messageEn,
      'message_fr': messageFr,
      'message_ar': messageAr,
    };
  }
}

class LeaveData {
  final int? id;
  final int? vendorId;
  final String? date;
  final String? reason;

  LeaveData({this.id, this.vendorId, this.date, this.reason});

  factory LeaveData.fromJson(Map<String, dynamic>? json) {
    if (json == null) return LeaveData();
    return LeaveData(
      id: json['id'] != null ? int.tryParse(json['id'].toString()) : null,
      vendorId: json['vendor_id'] != null
          ? int.tryParse(json['vendor_id'].toString())
          : null,
      date: json['date']?.toString(),
      reason: json['reason']?.toString(),
    );
  }
}
