import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Administración')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _AdminCard(title: 'Usuarios', subtitle: 'Gestiona clientes y choferes', icon: Icons.people),
            const SizedBox(height: 12),
            _AdminCard(title: 'Cargas', subtitle: 'Revisa todas las cargas', icon: Icons.local_shipping),
            const SizedBox(height: 12),
            _AdminCard(title: 'Suscripciones', subtitle: 'Activa planes de usuarios', icon: Icons.subscriptions),
          ],
        ),
      ),
    );
  }
}

class _AdminCard extends StatelessWidget {
  const _AdminCard({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
          child: Icon(icon, color: Theme.of(context).primaryColor),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
