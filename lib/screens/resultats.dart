import 'package:flutter/material.dart';
import '../widgets/commun.dart';

/// Cas d'utilisation : Consulter ses résultats
class Resultats extends StatelessWidget {
  const Resultats({super.key});

  Widget _tentative(String examen, String date, String note, bool reussi) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Carte(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(examen,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Couleurs.textDark)),
                  const SizedBox(height: 2),
                  Text(date,
                      style: const TextStyle(
                          fontSize: 12, color: Couleurs.textGrey)),
                ],
              ),
            ),
            Text(note,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Couleurs.textDark)),
            const SizedBox(width: 10),
            Pastille(
              reussi ? 'Réussi' : 'Échoué',
              couleur: reussi ? Couleurs.succes : Couleurs.alerte,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barreEcran('Mes résultats'),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Carte(
              child: Column(
                children: [
                  Text('16 / 20',
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                          color: Couleurs.primary)),
                  SizedBox(height: 4),
                  Text('Dernier examen : Bases de données',
                      style:
                      TextStyle(fontSize: 14, color: Couleurs.textGrey)),
                  SizedBox(height: 10),
                  Pastille('Réussi', couleur: Couleurs.succes),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const TitreSection('Historique des tentatives'),
            const SizedBox(height: 10),
            _tentative('Bases de données', '12 nov. 2026', '16 / 20', true),
            _tentative('Développement mobile', '5 nov. 2026', '13 / 20', true),
            _tentative('Réseaux informatiques', '28 oct. 2026', '8 / 20', false),
          ],
        ),
      ),
    );
  }
}
