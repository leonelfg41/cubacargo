class SubscriptionModel {
  final String userId;
  final String plan;
  final String status;
  final DateTime startDate;
  final DateTime endDate;

  SubscriptionModel({
    required this.userId,
    required this.plan,
    required this.status,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'plan': plan,
      'status': status,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    };
  }

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      userId: json['userId'] as String? ?? '',
      plan: json['plan'] as String? ?? 'basic',
      status: json['status'] as String? ?? 'active',
      startDate: DateTime.tryParse(json['startDate'] as String? ?? '') ?? DateTime.now(),
      endDate: DateTime.tryParse(json['endDate'] as String? ?? '') ?? DateTime.now(),
    );
  }
}
