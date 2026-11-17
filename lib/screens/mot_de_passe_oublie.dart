import 'package:flutter/material.dart';
import '../widgets/commun.dart';

/// Cas d'utilisation : Réinitialiser le mot de passe
class MotDePasseOublie extends StatelessWidget {
  const MotDePasseOublie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barreEcran('Mot de passe oublié'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: Couleurs.primaryClair,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.lock_reset,
                      size: 38, color: Couleurs.primary),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Réinitialiser votre mot de passe',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Couleurs.textDark,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Saisissez votre e-mail. Nous vous enverrons un lien pour choisir un nouveau mot de passe.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Couleurs.textGrey),
              ),
              const SizedBox(height: 28),
              const EtiquetteChamp('E-MAIL'),
              const SizedBox(height: 8),
              const ChampStatique(
                text: 'votre.email@domaine.com',
                isHint: true,
                icone: Icons.mail_outline,
              ),
              const Spacer(),
              const BoutonPrimaire('Envoyer le lien'),
              const SizedBox(height: 12),
              const BoutonContour('Retour à la connexion'),
            ],
          ),
        ),
      ),
    );
  }
}
