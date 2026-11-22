import 'package:flutter/material.dart';
import '../widgets/commun.dart';

/// Cas d'utilisation : S'inscrire
class PageInscription extends StatelessWidget {
  const PageInscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barreEcran('Inscription'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              EtiquetteChamp('NOM'),
              SizedBox(height: 8),
              ChampStatique(text: 'Votre nom', isHint: true),
              SizedBox(height: 16),
              EtiquetteChamp('PRÉNOM'),
              SizedBox(height: 8),
              ChampStatique(text: 'Votre prénom', isHint: true),
              SizedBox(height: 16),
              EtiquetteChamp('E-MAIL'),
              SizedBox(height: 8),
              ChampStatique(text: 'votre.email@domaine.com', isHint: true),
              SizedBox(height: 16),
              EtiquetteChamp('MOT DE PASSE'),
              SizedBox(height: 8),
              ChampStatique(text: '••••••••'),
              SizedBox(height: 16),
              EtiquetteChamp('CONFIRMER LE MOT DE PASSE'),
              SizedBox(height: 8),
              ChampStatique(text: '••••••••'),
              SizedBox(height: 32),
              BoutonPrimaire("S'inscrire"),
              SizedBox(height: 12),
              BoutonContour('Retour à la connexion'),
            ],
          ),
        ),
      ),
    );
  }
}
