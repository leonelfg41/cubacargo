import 'package:flutter/material.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _HomeCard(
              title: 'Publicar carga',
              subtitle: 'Añade origen, destino, tipo y fecha.',
              icon: Icons.local_shipping,
              onTap: () {
                Navigator.pushNamed(context, '/publish-load');
              },
            ),
            const SizedBox(height: 16),
            _HomeCard(
              title: 'Mis cargas',
              subtitle: 'Revisa estado y choferes interesados.',
              icon: Icons.list_alt,
              onTap: () {},
            ),
            const SizedBox(height: 16),
            _HomeCard(
              title: 'Suscripción',
              subtitle: 'Gestiona tu plan mensual.',
              icon: Icons.subscriptions,
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
