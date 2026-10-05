import 'package:flutter/material.dart';

class AvailableLoadsScreen extends StatelessWidget {
  const AvailableLoadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loads = [
      _LoadItem(
        origin: 'La Habana',
        destination: 'Varadero',
        type: 'Materiales de construcción',
        weight: '4.5 ton',
      ),
      _LoadItem(
        origin: 'Santa Clara',
        destination: 'Holguín',
        type: 'Productos agrícolas',
        weight: '2.1 ton',
      ),
      _LoadItem(
        origin: 'Camagüey',
        destination: 'Santiago de Cuba',
        type: 'Equipo industrial',
        weight: '6.0 ton',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Cargas disponibles')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: loads.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final load = loads[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${load.origin} → ${load.destination}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(load.type),
                  const SizedBox(height: 8),
                  Text('Peso: ${load.weight}'),
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
