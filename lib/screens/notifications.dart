import 'package:flutter/material.dart';
import '../widgets/commun.dart';

/// Cas d'utilisation : Recevoir des notifications
class Notifications extends StatelessWidget {
  const Notifications({super.key});

  Widget _notif(String titre, String message, String heure, bool nonLue) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Carte(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Couleurs.primaryClair,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.notifications_none,
                  color: Couleurs.primary),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titre,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight:
                          nonLue ? FontWeight.w700 : FontWeight.w500,
                          color: Couleurs.textDark)),
                  const SizedBox(height: 2),
                  Text(message,
                      style: const TextStyle(
                          fontSize: 13, color: Couleurs.textGrey)),
                  const SizedBox(height: 6),
                  Text(heure,
                      style: const TextStyle(
                          fontSize: 11, color: Couleurs.hintGrey)),
                ],
              ),
            ),
            if (nonLue)
              Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.only(top: 4),
                decoration: const BoxDecoration(
                  color: Couleurs.primary,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barreEcran('Notifications'),
      bottomNavigationBar: const BarreNavigation(index: 2),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _notif('Nouveau cours disponible',
                'Les widgets a été ajouté à Développement mobile.', 'Il y a 2 h', true),
            _notif('Examen planifié',
                'Examen de bases de données ce vendredi à 10 h.', 'Hier', true),
            _notif('Résultat publié',
                'Votre note de réseaux informatiques est disponible.', '10 nov.', false),
          ],
        ),
      ),
    );
  }
}
