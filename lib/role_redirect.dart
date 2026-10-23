import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cubacargo/config/app_routes.dart';

Future<void> redirectByRole(BuildContext context) async {
  final user = FirebaseAuth.instance.currentUser;
  final navigator = Navigator.of(context);

  if (user == null) {
    navigator.pushNamedAndRemoveUntil(AppRoutes.login, (_) => false);
    return;
  }

  final snap =
      await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

  final role = (snap.data()?['role'] ?? '').toString().toLowerCase().trim();
  debugPrint('UID: ${user.uid} ROLE: $role');

  String route;
  switch (role) {
    case 'chofer':
      route = AppRoutes.driverHome;
      break;
    case 'admin':
      route = AppRoutes.adminHome;
      break;
    case 'cliente':
      route = AppRoutes.clientHome;
      break;
    default:
      route = AppRoutes.login;
  }

  navigator.pushNamedAndRemoveUntil(route, (_) => false);
}
