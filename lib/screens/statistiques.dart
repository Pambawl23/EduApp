import 'package:flutter/material.dart';
import '../widgets/commun.dart';

/// Cas d'utilisation : Voir ses statistiques
class Statistiques extends StatelessWidget {
  const Statistiques({super.key});

  static const List<double> hauteurs = [40, 70, 30, 90, 60, 20, 50];
  static const List<String> jours = ['L', 'M', 'M', 'J', 'V', 'S', 'D'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barreEcran('Mes statistiques'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Expanded(
                      child: TuileStat(valeur: '12 h', libelle: "Temps d'étude")),
                  SizedBox(width: 12),
                  Expanded(
                      child: TuileStat(valeur: '23', libelle: 'Cours lus')),
                ],
              ),
              const SizedBox(height: 12),
              const Row(
                children: [
                  Expanded(
                      child: TuileStat(valeur: '5', libelle: 'Examens passés')),
                  SizedBox(width: 12),
                  Expanded(
                      child: TuileStat(valeur: '14,5', libelle: 'Note moyenne')),
                ],
              ),
              const SizedBox(height: 24),
              const TitreSection("Temps d'étude cette semaine"),
              const SizedBox(height: 10),
              Carte(
                child: SizedBox(
                  height: 130,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(7, (i) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 24,
                            height: hauteurs[i],
                            decoration: BoxDecoration(
                              color: Couleurs.primary,
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            jours[i],
                            style: const TextStyle(
                                fontSize: 12, color: Couleurs.textGrey),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
