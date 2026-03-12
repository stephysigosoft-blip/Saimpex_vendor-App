import 'package:saimpex_vendor/model/conversations_model.dart';

class GetConversationModel {
  bool? status;
  GetConversationData? data;
  String? message;

  GetConversationModel({this.status, this.data, this.message});

  GetConversationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? GetConversationData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class GetConversationData {
  Conversation? conversation;
  int? unreadCount;

  GetConversationData({this.conversation, this.unreadCount});

  GetConversationData.fromJson(Map<String, dynamic> json) {
    conversation = json['conversation'] != null
        ? Conversation.fromJson(json['conversation'])
        : null;
    unreadCount = json['unread_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (conversation != null) {
      data['conversation'] = conversation!.toJson();
    }
    data['unread_count'] = unreadCount;
    return data;
  }
}
