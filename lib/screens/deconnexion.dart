
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/auth_provider.dart';
import '../router/app_routes.dart';
import '../widgets/commun.dart';

class Deconnexion extends ConsumerWidget {
  const Deconnexion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: barreEcran('Déconnexion'),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Carte(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDECEC),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.logout,
                      size: 32,
                      color: Couleurs.alerte,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Se déconnecter ?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Couleurs.textDark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Vous devrez vous reconnecter pour accéder à vos formations.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Couleurs.textGrey,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Bouton de confirmation
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        ref.read(authProvider.notifier).logout();

                        context.go(AppRoutes.login);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Couleurs.alerte,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Confirmer la déconnexion'),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Bouton Annuler
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          final role = ref.read(authProvider).role;
                          context.go(
                            role == UserRole.administrateur
                                ? AppRoutes.adminDashboard
                                : AppRoutes.learnerDashboard,
                          );
                        }
                      },
                      child: const Text('Annuler'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
