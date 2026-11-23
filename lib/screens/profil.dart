import 'deconnexion.dart';
import 'package:flutter/material.dart';
import '../widgets/commun.dart';

/// Cas d'utilisation : Modifier son profil
class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barreEcran('Mon profil'),
      bottomNavigationBar: const BarreNavigation(index: 3),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 88,
                  height: 88,
                  decoration: const BoxDecoration(
                    color: Couleurs.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person,
                      size: 48, color: Colors.white),
                ),
              ),
              const SizedBox(height: 24),
              const EtiquetteChamp('NOM'),
              const SizedBox(height: 8),
              const ChampStatique(text: 'Diop'),
              const SizedBox(height: 16),
              const EtiquetteChamp('PRÉNOM'),
              const SizedBox(height: 8),
              const ChampStatique(text: 'Fatou'),
              const SizedBox(height: 16),
              const EtiquetteChamp('E-MAIL'),
              const SizedBox(height: 8),
              const ChampStatique(text: 'fatou.diop@domaine.com'),
              const SizedBox(height: 16),
              const EtiquetteChamp('MOT DE PASSE'),
              const SizedBox(height: 8),
              const ChampStatique(text: '••••••••'),
              const SizedBox(height: 28),
              const BoutonPrimaire('Enregistrer les modifications'),
              const SizedBox(height: 12),
              SizedBox(
                height: 48,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const Deconnexion(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Couleurs.alerte,
                    side: const BorderSide(color: Couleurs.alerte),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Se déconnecter'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
