
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/auth_provider.dart';
import '../router/app_routes.dart';

class PageConnexion extends ConsumerStatefulWidget {
  const PageConnexion({super.key});

  @override
  ConsumerState<PageConnexion> createState() => _PageConnexionState();
}

class _PageConnexionState extends ConsumerState<PageConnexion> {
  static const Color primary = Color(0xFF2F5094);
  static const Color labelGrey = Color(0xFF64748B);
  static const Color border = Color(0xFFC3CFE2);
  static const Color hintGrey = Color(0xFF94A3B8);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  UserRole selectedRole = UserRole.apprenant;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void seConnecter() {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez remplir tous les champs.'),
        ),
      );
      return;
    }

    ref.read(authProvider.notifier).login(email, selectedRole);

    final requestedLocation =
        GoRouterState.of(context).uri.queryParameters['from'];
    context.go(
      requestedLocation ??
          (selectedRole == UserRole.apprenant
              ? AppRoutes.learnerDashboard
              : AppRoutes.adminDashboard),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Connexion',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _FieldLabel('E-MAIL'),
              const SizedBox(height: 8),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: _decoration('votre.email@domaine.com'),
              ),
              const SizedBox(height: 20),
              const _FieldLabel('MOT DE PASSE'),
              const SizedBox(height: 8),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: _decoration('Votre mot de passe'),
              ),
              const SizedBox(height: 20),
              const _FieldLabel('TYPE DE COMPTE'),
              const SizedBox(height: 8),
              DropdownButtonFormField<UserRole>(
                value: selectedRole,
                decoration: _decoration('Choisir un rôle'),
                items: const [
                  DropdownMenuItem(
                    value: UserRole.apprenant,
                    child: Text('Apprenant'),
                  ),
                  DropdownMenuItem(
                    value: UserRole.administrateur,
                    child: Text('Administrateur'),
                  ),
                ],
                onChanged: (role) {
                  if (role != null) {
                    setState(() => selectedRole = role);
                  }
                },
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => context.push(AppRoutes.forgotPassword),
                  child: const Text(
                    'Mot de passe oublié ?',
                    style: TextStyle(color: primary),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: seConnecter,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Se connecter',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 48,
                child: OutlinedButton(
                  onPressed: () => context.push(AppRoutes.register),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: primary,
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: primary, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Créer un compte',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _decoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: hintGrey),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: primary, width: 1.5),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String text;

  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: _PageConnexionState.labelGrey,
        letterSpacing: 0.3,
      ),
    );
  }
}
