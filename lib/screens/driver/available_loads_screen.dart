import 'package:flutter/material.dart';
import '../../services/firestore_service.dart';

class AvailableLoadsScreen extends StatelessWidget {
  const AvailableLoadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cargas disponibles')),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: FirestoreService().streamPublishedLoads(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error cargando cargas: ${snapshot.error}'),
            );
          }

          final loads = snapshot.data ?? [];
          if (loads.isEmpty) {
            return const Center(child: Text('No hay cargas publicadas'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: loads.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final load = loads[index];
              final origin = (load['origin'] ?? '').toString();
              final destination = (load['destination'] ?? '').toString();
              final type = (load['type'] ?? '').toString();
              final weight = (load['weight'] ?? '').toString();

              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$origin → $destination',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(type.isEmpty ? 'Sin tipo' : type),
                      const SizedBox(height: 8),
                      Text('Peso: ${weight.isEmpty ? '-' : weight}'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Carga aceptada')),
                          );
                        },
                        child: const Text('Aceptar carga'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _LoadItem {
  const _LoadItem({
    required this.origin,
    required this.destination,
    required this.type,
    required this.weight,
  });

  final String origin;
  final String destination;
  final String type;
  final String weight;
}
