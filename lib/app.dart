import 'package:flutter/material.dart';
import 'package:cubacargo/config/app_routes.dart';
import 'package:cubacargo/config/app_theme.dart';
import 'package:cubacargo/screens/auth/login_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CubaCargo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
