import 'package:flutter/material.dart';
import '../widgets/commun.dart';

/// Cas d'utilisation : Voir ses activités à réaliser
class ActivitesARealiser extends StatelessWidget {
  const ActivitesARealiser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barreEcran('Activités à réaliser'),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            TitreSection("Aujourd'hui"),
            SizedBox(height: 10),
            LigneActivite(
              titre: 'Les widgets Flutter',
              formation: 'Développement mobile',
              echeance: '30 min',
            ),
            SizedBox(height: 10),
            LigneActivite(
              titre: 'Introduction à SQL',
              formation: 'Bases de données',
              echeance: '20 min',
            ),
            SizedBox(height: 24),
            TitreSection('Cette semaine'),
            SizedBox(height: 10),
            LigneActivite(
              titre: 'Examen : bases de données',
              formation: 'Bases de données',
              echeance: 'Vendredi',
              estExamen: true,
            ),
            SizedBox(height: 10),
            LigneActivite(
              titre: 'Navigation entre écrans',
              formation: 'Développement mobile',
              echeance: 'Samedi',
            ),
          ],
        ),
      ),
    );
  }
}
