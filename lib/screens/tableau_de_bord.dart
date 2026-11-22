import 'package:flutter/material.dart';
import '../widgets/commun.dart';

/// Cas d'utilisation : Consulter son tableau de bord
/// (il regroupe statistiques, activités et progression)
class TableauDeBord extends StatelessWidget {
  const TableauDeBord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barreEcran('Tableau de bord'),
      bottomNavigationBar: const BarreNavigation(index: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Bonjour, Fatou',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Couleurs.textDark,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Voici un résumé de votre apprentissage',
                style: TextStyle(fontSize: 14, color: Couleurs.textGrey),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: TuileStat(valeur: '4', libelle: 'Formations')),
                  SizedBox(width: 12),
                  Expanded(child: TuileStat(valeur: '1', libelle: 'Terminée')),
                  SizedBox(width: 12),
                  Expanded(
                      child: TuileStat(valeur: '14,5', libelle: 'Moyenne /20')),
                ],
              ),
              SizedBox(height: 24),
              TitreSection('Progression globale'),
              SizedBox(height: 10),
              Carte(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Toutes formations',
                            style: TextStyle(
                                fontSize: 14, color: Couleurs.textGrey)),
                        Text('65 %',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Couleurs.primary)),
                      ],
                    ),
                    SizedBox(height: 10),
                    BarreProgression(0.65),
                  ],
                ),
              ),
              SizedBox(height: 24),
              TitreSection('Activités à réaliser'),
              SizedBox(height: 10),
              LigneActivite(
                titre: 'Les widgets Flutter',
                formation: 'Développement mobile',
                echeance: 'Aujourd\'hui',
              ),
              SizedBox(height: 10),
              LigneActivite(
                titre: 'Examen final : bases de données',
                formation: 'Bases de données',
                echeance: 'Vendredi',
                estExamen: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
