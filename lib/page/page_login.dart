import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: SingleChildScrollView(
          // Membuat halaman bisa di-scroll jika keyboard muncul
          padding: const EdgeInsets.all(24.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            // Membatasi lebar form di layar web yang lebar
            child: const LoginForm(),
          ),
        ),
      ),
    );
  }
}

final authService = AuthService();

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    // PENTING: selalu dispose controller saat widget di-destroy
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    // 1. Validasi semua field
    if (!_formKey.currentState!.validate()) return;

    // 2. Simpan semua field (trigger onSaved callbacks)
    _formKey.currentState!.save();

    setState(() => _isLoading = true);
    try {
      await authService.login(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed('/home');
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      // autovalidateMode: validate saat user mulai mengetik
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: Validators.email, // extracted validator
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            obscureText: !_isPasswordVisible,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _handleSubmit(),
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () =>
                    setState(() => _isPasswordVisible = !_isPasswordVisible),
              ),
            ),
            validator: Validators.password,
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: _isLoading ? null : _handleSubmit,
            child: _isLoading
                ? const SizedBox.square(
                    dimension: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Login'),
          ),
        ],
      ),
    );
  }
}

class Validators {
  static String? email(String? value) {
    if (value == null || value.isEmpty) return 'Email wajib diisi';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) return 'Format email tidak valid';
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Password wajib diisi';
    if (value.length < 8) return 'Password minimal 8 karakter';
    return null;
  }

  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) return 'Field ini wajib diisi';
    return null;
  }
}

class AuthService {
  Future<void> login({required String email, required String password}) async {
    // Simulasi delay network API selama 2 detik
    await Future.delayed(const Duration(seconds: 2));

    // Simulasi jika login gagal (opsional untuk testing)
    if (email == "error@gmail.com") {
      throw Exception("Email atau password salah!");
    }
  }
}
