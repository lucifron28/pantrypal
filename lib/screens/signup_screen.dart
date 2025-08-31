import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.kitchen, size: 64, color: colorScheme.primary),
                const SizedBox(height: 16),
                const Text(
                  'PantryPal',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  String? _error;

  String? _validateConfirmPassword(String? val) {
    if (val == null || val.isEmpty) return 'Please confirm your password';
    if (val != _password) return 'Passwords do not match';
    return null;
  }

  Future<void> _signUp() async {
    setState(() { _isLoading = true; _error = null; });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      if (mounted) Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      setState(() { _error = e.message; });
    } finally {
      setState(() { _isLoading = false; });
    }
  }

  @override
  void dispose() {
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              onChanged: (val) => _email = val,
              validator: (val) => val != null && val.contains('@') ? null : 'Enter a valid email',
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: (val) => _password = val,
              validator: (val) => val != null && val.length >= 6 ? null : 'Password too short',
            ),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
              onChanged: (val) {},
              validator: _validateConfirmPassword,
            ),
            if (_error != null) ...[
              const SizedBox(height: 8),
              Text(_error!, style: const TextStyle(color: Colors.red)),
            ],
            const SizedBox(height: 16),
            _isLoading
                ? const CircularProgressIndicator()
                : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        foregroundColor: colorScheme.onPrimary,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _signUp();
                        }
                      },
                      child: const Text('Sign Up'),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
