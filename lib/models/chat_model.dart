import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String id;
  final String loadId;
  final String clientId;
  final String driverId;
  final DateTime updatedAt;

  ChatModel({
    required this.id,
    required this.loadId,
    required this.clientId,
    required this.driverId,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'loadId': loadId,
      'clientId': clientId,
      'driverId': driverId,
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'] as String? ?? '',
      loadId: json['loadId'] as String? ?? '',
      clientId: json['clientId'] as String? ?? '',
      driverId: json['driverId'] as String? ?? '',
      updatedAt: (json['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}
