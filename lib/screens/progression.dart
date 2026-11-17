import 'package:flutter/material.dart';
import '../widgets/commun.dart';

/// Cas d'utilisation : Voir sa barre de progression
class Progression extends StatelessWidget {
  const Progression({super.key});

  Widget _ligne(String titre, String detail, double valeur) {
    return Carte(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  titre,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Couleurs.textDark,
                  ),
                ),
              ),
              Text(
                '${(valeur * 100).round()} %',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Couleurs.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(detail,
              style: const TextStyle(fontSize: 12, color: Couleurs.textGrey)),
          const SizedBox(height: 10),
          BarreProgression(valeur),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barreEcran('Ma progression'),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Carte(
              child: Column(
                children: const [
                  Text(
                    '65 %',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: Couleurs.primary,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text('Progression globale',
                      style:
                      TextStyle(fontSize: 14, color: Couleurs.textGrey)),
                  SizedBox(height: 12),
                  BarreProgression(0.65),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const TitreSection('Par formation'),
            const SizedBox(height: 10),
            _ligne('Développement mobile', '6 cours sur 10', 0.6),
            const SizedBox(height: 10),
            _ligne('Bases de données', '8 cours sur 10', 0.8),
            const SizedBox(height: 10),
            _ligne('Réseaux informatiques', '3 cours sur 12', 0.25),
          ],
        ),
      ),
    );
  }
}
