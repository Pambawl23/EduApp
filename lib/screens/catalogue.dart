import 'package:flutter/material.dart';
import '../widgets/commun.dart';

/// Cas d'utilisation : Consulter le catalogue
class Catalogue extends StatelessWidget {
  const Catalogue({super.key});

  Widget _formation(String titre, String niveau, String duree) {
    return Carte(
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: Couleurs.placeholderBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.image_outlined, color: Couleurs.textGrey),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titre,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Couleurs.textDark,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Pastille(niveau),
                    const SizedBox(width: 8),
                    const Icon(Icons.schedule,
                        size: 14, color: Couleurs.textGrey),
                    const SizedBox(width: 4),
                    Text(duree,
                        style: const TextStyle(
                            fontSize: 12, color: Couleurs.textGrey)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barreEcran('Catalogue'),
      bottomNavigationBar: const BarreNavigation(index: 1),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const ChampStatique(
              text: 'Rechercher une formation',
              isHint: true,
              icone: Icons.search,
            ),
            const SizedBox(height: 16),
            const TitreSection('Formations disponibles'),
            const SizedBox(height: 10),
            _formation('Développement mobile', 'Débutant', '20 h'),
            const SizedBox(height: 10),
            _formation('Bases de données', 'Intermédiaire', '15 h'),
            const SizedBox(height: 10),
            _formation('Réseaux informatiques', 'Débutant', '18 h'),
            const SizedBox(height: 10),
            _formation('Gestion de projet', 'Avancé', '12 h'),
          ],
        ),
      ),
    );
  }
}
