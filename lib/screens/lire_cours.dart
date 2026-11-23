import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/app_routes.dart';
import '../widgets/commun.dart';

/// Cas d'utilisation : Lire un cours
class LireCours extends StatelessWidget {
  const LireCours({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barreEcran('Cours'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Cours 2 sur 10',
                  style: TextStyle(fontSize: 12, color: Couleurs.textGrey)),
              const SizedBox(height: 6),
              const BarreProgression(0.2),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: const [
                    Text(
                      'Les widgets',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Couleurs.textDark,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Dans Flutter, tout est un widget : un bouton, un texte, une marge ou même une mise en page complète.',
                      style: TextStyle(
                          fontSize: 16, height: 1.5, color: Couleurs.textDark),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Il existe deux grandes familles : les widgets sans état (StatelessWidget), qui ne changent pas, et les widgets avec état (StatefulWidget), qui se mettent à jour quand les données changent.',
                      style: TextStyle(
                          fontSize: 16, height: 1.5, color: Couleurs.textDark),
                    ),
                    SizedBox(height: 12),
                    ImagePlaceholder(hauteur: 160),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: BoutonContour(
                      'Précédent',
                      onPressed: () => context.canPop()
                          ? context.pop()
                          : context.go(AppRoutes.catalogue),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: BoutonPrimaire(
                      'Suivant',
                      onPressed: () => context.go(AppRoutes.learnerDashboard),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
