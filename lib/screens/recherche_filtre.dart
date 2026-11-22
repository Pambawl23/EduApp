import 'package:flutter/material.dart';
import '../widgets/commun.dart';

/// Cas d'utilisation : Rechercher / filtrer les formations
class RechercheFiltre extends StatelessWidget {
  const RechercheFiltre({super.key});

  Widget _groupe(String titre, List<String> options, int selectionne) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitreSection(titre),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(options.length, (i) {
            final actif = i == selectionne;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: actif ? Couleurs.primary : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: actif ? Couleurs.primary : Couleurs.border,
                ),
              ),
              child: Text(
                options[i],
                style: TextStyle(
                  fontSize: 14,
                  color: actif ? Colors.white : Couleurs.textGrey,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barreEcran('Rechercher'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ChampStatique(
                text: 'Développement',
                icone: Icons.search,
              ),
              const SizedBox(height: 24),
              _groupe('Catégorie',
                  ['Toutes', 'Informatique', 'Gestion', 'Langues'], 1),
              const SizedBox(height: 24),
              _groupe('Niveau',
                  ['Tous', 'Débutant', 'Intermédiaire', 'Avancé'], 0),
              const SizedBox(height: 24),
              _groupe('Durée', ['Toutes', '< 10 h', '10 à 20 h', '> 20 h'], 0),
              const Spacer(),
              const BoutonPrimaire('Appliquer les filtres'),
              const SizedBox(height: 12),
              const BoutonContour('Réinitialiser'),
            ],
          ),
        ),
      ),
    );
  }
}
