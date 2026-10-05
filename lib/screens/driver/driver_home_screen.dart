import 'package:flutter/material.dart';

class DriverHomeScreen extends StatelessWidget {
  const DriverHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chofer')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _HomeCard(
              title: 'Cargas disponibles',
              subtitle: 'Busca viajes por zona y tipo de carga.',
              icon: Icons.local_shipping,
              onTap: () {
                Navigator.pushNamed(context, '/available-loads');
              },
            ),
            const SizedBox(height: 16),
            _HomeCard(
              title: 'Mis trabajos',
              subtitle: 'Revisa tus cargas aceptadas.',
              icon: Icons.task,
              onTap: () {},
            ),
            const SizedBox(height: 16),
            _HomeCard(
              title: 'Perfil',
              subtitle: 'Actualiza tu información y datos del vehículo.',
              icon: Icons.person,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  const _HomeCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

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
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
