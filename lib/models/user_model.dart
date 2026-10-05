import 'package:cloud_firestore/cloud_firestore.dart';

enum UserRole {
  client,
  driver,
  admin;

  static UserRole fromString(String value) {
    switch (value.toLowerCase()) {
      case 'client':
        return UserRole.client;
      case 'driver':
        return UserRole.driver;
      case 'admin':
        return UserRole.admin;
      default:
        return UserRole.client;
    }
  }

  String get label {
    switch (this) {
      case UserRole.client:
        return 'Cliente';
      case UserRole.driver:
        return 'Chofer';
      case UserRole.admin:
        return 'Admin';
    }
  }
}

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final UserRole role;
  final String? companyName;
  final String? profileImageUrl;
  final bool active;
  final bool subscriptionActive;
  final DateTime createdAt;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    this.companyName,
    this.profileImageUrl,
    this.active = true,
    this.subscriptionActive = true,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role.name,
      'companyName': companyName,
      'profileImageUrl': profileImageUrl,
      'active': active,
      'subscriptionActive': subscriptionActive,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] as String? ?? '',
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      role: UserRole.fromString(json['role'] as String? ?? 'client'),
      companyName: json['companyName'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      active: json['active'] as bool? ?? true,
      subscriptionActive: json['subscriptionActive'] as bool? ?? true,
      createdAt: (json['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}
