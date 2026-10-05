import 'package:cloud_firestore/cloud_firestore.dart';

enum LoadStatus {
  pending,
  accepted,
  inTransit,
  completed,
  cancelled;

  static LoadStatus fromString(String value) {
    switch (value.toLowerCase()) {
      case 'accepted':
        return LoadStatus.accepted;
      case 'intransit':
      case 'in_transit':
        return LoadStatus.inTransit;
      case 'completed':
        return LoadStatus.completed;
      case 'cancelled':
      case 'canceled':
        return LoadStatus.cancelled;
      default:
        return LoadStatus.pending;
    }
  }

  String get label {
    switch (this) {
      case LoadStatus.pending:
        return 'Pendiente';
      case LoadStatus.accepted:
        return 'Aceptada';
      case LoadStatus.inTransit:
        return 'En tránsito';
      case LoadStatus.completed:
        return 'Completada';
      case LoadStatus.cancelled:
        return 'Cancelada';
    }
  }
}

class LoadModel {
  final String id;
  final String clientId;
  final String origin;
  final String destination;
  final String type;
  final String weight;
  final String description;
  final DateTime date;
  final LoadStatus status;
  final String? driverId;
  final double price;
  final DateTime createdAt;

  LoadModel({
    required this.id,
    required this.clientId,
    required this.origin,
    required this.destination,
    required this.type,
    required this.weight,
    required this.description,
    required this.date,
    this.status = LoadStatus.pending,
    this.driverId,
    this.price = 0,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'clientId': clientId,
      'origin': origin,
      'destination': destination,
      'type': type,
      'weight': weight,
      'description': description,
      'date': Timestamp.fromDate(date),
      'status': status.name,
      'driverId': driverId,
      'price': price,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory LoadModel.fromJson(Map<String, dynamic> json) {
    return LoadModel(
      id: json['id'] as String? ?? '',
      clientId: json['clientId'] as String? ?? '',
      origin: json['origin'] as String? ?? '',
      destination: json['destination'] as String? ?? '',
      type: json['type'] as String? ?? '',
      weight: json['weight'] as String? ?? '',
      description: json['description'] as String? ?? '',
      date: (json['date'] as Timestamp?)?.toDate() ?? DateTime.now(),
      status: LoadStatus.fromString(json['status'] as String? ?? 'pending'),
      driverId: json['driverId'] as String?,
      price: (json['price'] as num?)?.toDouble() ?? 0,
      createdAt: (json['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}
