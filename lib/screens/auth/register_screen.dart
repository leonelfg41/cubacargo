import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cubacargo/config/app_routes.dart';
import 'package:cubacargo/services/auth_service.dart';
import 'package:cubacargo/services/firestore_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();

  String _selectedRole = 'Cliente';
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear cuenta')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration:
                  const InputDecoration(labelText: 'Correo electrónico'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: 'Teléfono'),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              initialValue: _selectedRole,
              decoration: const InputDecoration(labelText: 'Rol'),
              items: const [
                DropdownMenuItem(value: 'Cliente', child: Text('Cliente')),
                DropdownMenuItem(value: 'Chofer', child: Text('Chofer')),
                DropdownMenuItem(value: 'Admin', child: Text('Admin')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() => _selectedRole = value);
                }
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Contraseña'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _loading ? null : _handleRegister,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 52),
              ),
              child: _loading
                  ? const SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Registrarme'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleRegister() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final phone = _phoneController.text.trim();
    final password = _passwordController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Completa los datos obligatorios')),
      );
      return;
    }

    setState(() => _loading = true);

    try {
      final cred = await _authService.registerWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = cred.user!.uid;

      await _firestoreService.saveUser(
        uid: uid,
        data: {
          'name': name,
          'email': email,
          'phone': phone,
          'role': _selectedRole.toLowerCase(), // cliente | chofer | admin
          'createdAt': FieldValue.serverTimestamp(),
        },
      );

      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.clientHome);
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error auth: ${e.code}')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
