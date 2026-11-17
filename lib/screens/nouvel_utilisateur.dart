import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class NouvelUtilisateur extends StatelessWidget {
  const NouvelUtilisateur({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminPage(
      bar: const AdminBar('Nouvel Utilisateur'),
      bottom: Column(mainAxisSize: MainAxisSize.min, children: const [
        AppButton('Enregistrer l\'utilisateur', icon: Icons.check),
        AppButton.text('Annuler'),
      ]),
      children: [
        Row(children: [
          const IconBox(Icons.person_add_outlined, size: 44),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
              Text('Création d\'un profil', style: T.h2),
              Text('Renseignez les informations pour ajouter un compte à la plateforme académique.', style: T.caption),
            ]),
          ),
        ]),
        gap16,
        AppCard(
          child: Row(children: [
            Stack(children: [
              const Avatar('ÉM', size: 56),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border.all(color: C.border)),
                  child: const Icon(Icons.photo_camera_outlined, size: 12, color: C.primary),
                ),
              ),
            ]),
            const SizedBox(width: 14),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: const [
                  Flexible(child: Text('Élodie Moreau', style: T.title)),
                  SizedBox(width: 8),
                  Tag('Nouveau'),
                ]),
                const Text('elodie.moreau@invalide', style: T.caption),
              ]),
            ),
          ]),
        ),
        gap16,
        const Field('Nom', value: 'Moreau', prefix: Icons.badge_outlined),
        const Field('Prénom', value: 'Élodie', prefix: Icons.person_outline),
        const Field('E-mail',
            value: 'elodie.moreau@invalide',
            prefix: Icons.mail_outline,
            error: 'Adresse e-mail invalide. Veuillez entrer un format valide (ex. nom@domaine.fr).',
            suffix: Tag('Format erroné', bg: C.dangerSoft, fg: C.dangerDark)),
        const Field('Mot de passe',
            value: '••••••••••••',
            prefix: Icons.lock_outline,
            suffix: Icon(Icons.visibility_outlined, size: 20, color: C.meta),
            helper: 'Au moins 8 caractères, 1 chiffre et 1 majuscule.'),
        const Eyebrow('Rôle d\'utilisateur'),
        gap8,
        const ChoiceCard('Apprenant',
            subtitle: 'Accès aux cours et examens assignés, suivi des progressions personnelles.',
            icon: Icons.school_outlined,
            selected: true),
        const ChoiceCard('Administrateur',
            subtitle: 'Accès complet au panneau de gestion, gestion des promotions et sessions.',
            icon: Icons.admin_panel_settings_outlined),
        const InfoBanner('Un courriel d\'activation sera transmis après validation.',
            icon: Icons.mark_email_read_outlined, title: 'Invitation instantanée'),
      ],
    );
  }
}
