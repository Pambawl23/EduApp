import 'package:flutter/material.dart';
import '../widgets/commun.dart';

/// Cas d'utilisation : S'inscrire à une formation
class InscriptionFormation extends StatelessWidget {
  const InscriptionFormation({super.key});

  Widget _cours(String titre, String duree) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Carte(
        child: Row(
          children: [
            const Icon(Icons.menu_book_outlined, color: Couleurs.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Text(titre,
                  style: const TextStyle(
                      fontSize: 14, color: Couleurs.textDark)),
            ),
            Text(duree,
                style:
                const TextStyle(fontSize: 12, color: Couleurs.textGrey)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barreEcran('Formation'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const ImagePlaceholder(),
                    const SizedBox(height: 16),
                    const Text(
                      'Développement mobile',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Couleurs.textDark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        Pastille('Débutant'),
                        SizedBox(width: 8),
                        Pastille('20 h', couleur: Couleurs.textGrey),
                        SizedBox(width: 8),
                        Pastille('10 cours', couleur: Couleurs.textGrey),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Apprenez à créer des applications mobiles avec Flutter, des premiers écrans jusqu\'à la publication.',
                      style: TextStyle(fontSize: 14, color: Couleurs.textGrey),
                    ),
                    const SizedBox(height: 20),
                    const TitreSection('Contenu de la formation'),
                    const SizedBox(height: 10),
                    _cours('Introduction à Flutter', '30 min'),
                    _cours('Les widgets', '45 min'),
                    _cours('Mise en page', '40 min'),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const BoutonPrimaire("S'inscrire à cette formation"),
            ],
          ),
        ),
      ),
    );
  }
}
