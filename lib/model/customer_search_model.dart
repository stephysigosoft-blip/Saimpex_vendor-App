import 'package:saimpex_vendor/model/conversations_model.dart';

class CustomerSearchModel {
  bool? status;
  List<Customer>? data;
  String? message;

  CustomerSearchModel({this.status, this.data, this.message});

  CustomerSearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      if (json['data'] is List) {
        data = <Customer>[];
        json['data'].forEach((v) {
          data!.add(Customer.fromJson(v));
        });
      } else if (json['data'] is Map && json['data']['customers'] != null) {
         data = <Customer>[];
         json['data']['customers'].forEach((v) {
          data!.add(Customer.fromJson(v));
        });
      }
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}
