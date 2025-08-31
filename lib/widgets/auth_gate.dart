import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pantrypal/providers/auth_provider.dart';
import 'package:pantrypal/screens/auth_screen.dart';

class AuthGate extends ConsumerWidget {
  final Widget child;
  const AuthGate({required this.child, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(firebaseUserProvider);
    return userAsync.when(
      data: (user) => user == null ? const AuthScreen() : child,
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, st) => Scaffold(body: Center(child: Text('Auth error: $e'))),
    );
  }
}
