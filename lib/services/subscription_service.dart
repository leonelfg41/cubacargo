class SubscriptionService {
  static const String basicPlan = 'basic';
  static const String premiumPlan = 'premium';

  Map<String, dynamic> get plans => {
    'basic': {
      'name': 'Básico',
      'price': 15,
      'description': 'Acceso para usuarios individuales.',
    },
    'premium': {
      'name': 'Premium',
      'price': 30,
      'description': 'Funciones avanzadas para flotas y clientes frecuentes.',
    },
  };
}
