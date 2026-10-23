import 'package:firebase_auth/firebase_auth.dart';
import 'package:cubacargo/services/role_redirect.dart';

// después de signInWithEmailAndPassword(...)
if (!context.mounted) return;
await redirectByRole(context);