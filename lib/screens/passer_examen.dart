import 'package:flutter/material.dart';
import '../widgets/commun.dart';

/// Cas d'utilisation : Passer un examen
class PasserExamen extends StatelessWidget {
  const PasserExamen({super.key});

  Widget _choix(String lettre, String texte, bool selectionne) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: selectionne ? Couleurs.primaryClair : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: selectionne ? Couleurs.primary : Couleurs.border,
          width: selectionne ? 1.5 : 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: selectionne ? Couleurs.primary : Couleurs.placeholderBg,
              shape: BoxShape.circle,
            ),
            child: Text(
              lettre,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: selectionne ? Colors.white : Couleurs.textGrey,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(texte,
                style: const TextStyle(
                    fontSize: 15, color: Couleurs.textDark)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barreEcran('Examen'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Question 3 sur 10',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Couleurs.textDark)),
                  Row(
                    children: [
                      Icon(Icons.timer_outlined,
                          size: 18, color: Couleurs.attention),
                      SizedBox(width: 4),
                      Text('12:45',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Couleurs.attention)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const BarreProgression(0.3),
              const SizedBox(height: 24),
              const Text(
                'Quel widget Flutter permet d\'afficher une liste défilante ?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Couleurs.textDark,
                ),
              ),
              const SizedBox(height: 20),
              _choix('A', 'Column', false),
              _choix('B', 'ListView', true),
              _choix('C', 'Container', false),
              _choix('D', 'SizedBox', false),
              const Spacer(),
              const Row(
                children: [
                  Expanded(child: BoutonContour('Précédent')),
                  SizedBox(width: 12),
                  Expanded(child: BoutonPrimaire('Suivant')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
