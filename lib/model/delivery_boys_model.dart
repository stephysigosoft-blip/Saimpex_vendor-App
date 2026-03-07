class DeliveryBoysModel {
  bool? status;
  DeliveryBoysData? data;
  String? message;

  DeliveryBoysModel({this.status, this.data, this.message});

  DeliveryBoysModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    status = json['status'] == true || json['status']?.toString() == "true";
    data = json['data'] != null
        ? DeliveryBoysData.fromJson(json['data'])
        : null;
    message = json['message']?.toString();
  }
}

class DeliveryBoysData {
  DeliveryStaffs? deliveryStaffs;

  DeliveryBoysData({this.deliveryStaffs});

  DeliveryBoysData.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    deliveryStaffs = json['delivery_staffs'] != null
        ? DeliveryStaffs.fromJson(json['delivery_staffs'])
        : null;
  }
}

class DeliveryStaffs {
  int? currentPage;
  List<DeliveryBoy>? data;
  int? lastPage;
  int? perPage;
  int? total;

  DeliveryStaffs({
    this.currentPage,
    this.data,
    this.lastPage,
    this.perPage,
    this.total,
  });

  DeliveryStaffs.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <DeliveryBoy>[];
      json['data'].forEach((v) {
        data!.add(DeliveryBoy.fromJson(v));
      });
    }
    lastPage = json['last_page'];
    perPage = json['per_page'];
    total = json['total'];
  }
}

class DeliveryBoy {
  int? id;
  String? name;
  int? countryCodeId;
  String? mobile;
  String? address;
  String? image;
  int? gender;
  int? status;
  String? createdAt;
  String? formattedCreatedOn;

  DeliveryBoy({
    this.id,
    this.name,
    this.countryCodeId,
    this.mobile,
    this.address,
    this.image,
    this.gender,
    this.status,
    this.createdAt,
    this.formattedCreatedOn,
  });

  DeliveryBoy.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    id = json['id'];
    name = json['name']?.toString();
    countryCodeId = json['country_code_id'];
    mobile = json['mobile']?.toString();
    address = json['address']?.toString();
    image = json['image']?.toString();
    gender = json['gender'];
    status = json['status'];
    createdAt = json['created_at']?.toString();
    formattedCreatedOn = json['formatted_created_on']?.toString();
  }
}
