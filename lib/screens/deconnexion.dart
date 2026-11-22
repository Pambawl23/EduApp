import 'package:flutter/material.dart';
import '../widgets/commun.dart';

/// Cas d'utilisation : Se déconnecter
class Deconnexion extends StatelessWidget {
  const Deconnexion({super.key});

  @override
  Widget build(BuildContext context) {
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
                    child: const Icon(Icons.logout,
                        size: 32, color: Couleurs.alerte),
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
                    style: TextStyle(fontSize: 14, color: Couleurs.textGrey),
                  ),
                  const SizedBox(height: 24),
                  const BoutonPrimaire('Se déconnecter'),
                  const SizedBox(height: 12),
                  const BoutonContour('Annuler'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
