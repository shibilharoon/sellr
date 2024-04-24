import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  String? messagetype;
  String? recieverId;
  String? senderId;
  String? senderEmailId;
  String? content;
  Timestamp? time;
  // bool sentSuccessfully;

  ChatModel(
      {required this.messagetype,
      // required this.sentSuccessfully,
      required this.content,
      required this.senderId,
      required this.senderEmailId,
      required this.time,
      required this.recieverId});
  factory ChatModel.toJson(Map<String, dynamic> json) {
    return ChatModel(
      messagetype: json['messagetype'],
      content: json['content'],
      senderId: json['senderId'],
      senderEmailId: json['senderEmailId'],
      time: json['time'],
      recieverId: json['recieverId'],
      // sentSuccessfully: json["sendSuccessfully"]
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'messagetype': messagetype,
      'content': content,
      'senderId': senderId,
      'senderEmailId': senderEmailId,
      'recieverId': recieverId,
      'time': time,
      // 'sendSuccesssfully':sentSuccessfully
    };
  }
}
