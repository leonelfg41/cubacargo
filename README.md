# CubaCargo

CubaCargo es una app MVP para conectar clientes que necesitan transportar cargas pesadas con choferes disponibles. La app está pensada para Android y usa Flutter + Firebase.

## Stack

- Flutter
- Firebase Auth
- Cloud Firestore
- Firebase Storage
- Provider

## Estructura del proyecto

- `lib/config`: configuración global y rutas
- `lib/models`: modelos de datos
- `lib/screens`: pantallas por rol
- `lib/services`: servicios de autenticación, Firestore, suscripciones
- `lib/widgets`: widgets reutilizables

## Requisitos

- Flutter SDK 3.19+
- Android Studio o VS Code
- Cuenta de Firebase

## Configuración

1. Instala Flutter y comprueba que funcione:
   ```bash
   flutter --version
   ```

2. Clona el repositorio y entra a la carpeta:
   ```bash
   git clone https://github.com/leonelfg41/cubacargo.git
   cd cubacargo
   ```

3. Instala dependencias:
   ```bash
   flutter pub get
   ```

4. Configura Firebase con FlutterFire:
   ```bash
   flutterfire configure
   ```

5. Corre la app:
   ```bash
   flutter run
   ```

## MVP actual

- Registro e inicio de sesión
- Perfil por rol: cliente, chofer, administrador
- Publicar carga
- Ver cargas disponibles
- Aceptar carga
- Pantalla básica de administración
- Estructura lista para seguir desarrollando el chat y suscripciones

## Próximos pasos

- Firebase Authentication real con registro por email
- Firestore para clientes, cargas y chats
- Sistema de suscripciones mensual
- Panel admin
- Notificaciones push
- Mapas y geolocalización

## Autor

Proyecto inicial para CubaCargo.
