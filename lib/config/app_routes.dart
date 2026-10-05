import 'package:flutter/material.dart';
import 'package:cubacargo/screens/admin/admin_home_screen.dart';
import 'package:cubacargo/screens/auth/login_screen.dart';
import 'package:cubacargo/screens/auth/register_screen.dart';
import 'package:cubacargo/screens/client/client_home_screen.dart';
import 'package:cubacargo/screens/client/publish_load_screen.dart';
import 'package:cubacargo/screens/driver/available_loads_screen.dart';
import 'package:cubacargo/screens/driver/driver_home_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String clientHome = '/client-home';
  static const String publishLoad = '/publish-load';
  static const String driverHome = '/driver-home';
  static const String availableLoads = '/available-loads';
  static const String adminHome = '/admin-home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case clientHome:
        return MaterialPageRoute(builder: (_) => const ClientHomeScreen());
      case publishLoad:
        return MaterialPageRoute(builder: (_) => const PublishLoadScreen());
      case driverHome:
        return MaterialPageRoute(builder: (_) => const DriverHomeScreen());
      case availableLoads:
        return MaterialPageRoute(builder: (_) => const AvailableLoadsScreen());
      case adminHome:
        return MaterialPageRoute(builder: (_) => const AdminHomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
