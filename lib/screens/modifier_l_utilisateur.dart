import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class ModifierLUtilisateur extends StatelessWidget {
  const ModifierLUtilisateur({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminPage(
      bar: const AdminBar('Modifier L\'Utilisateur'),
      bottom: Column(mainAxisSize: MainAxisSize.min, children: const [
        AppButton('Enregistrer les modifications', icon: Icons.save_outlined),
        AppButton.text('Annuler'),
      ]),
      children: [
        const InfoBanner('Modifications enregistrées avec succès',
            icon: Icons.check_circle, kind: Kind.published),
        Center(
          child: Column(children: [
            Stack(children: [
              const Avatar('SM', size: 88),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(7),
                  decoration: const BoxDecoration(color: C.primary, shape: BoxShape.circle),
                  child: const Icon(Icons.photo_camera_outlined, size: 16, color: Colors.white),
                ),
              ),
            ]),
            gap12,
            const Text('Sophie Martin', style: T.h2),
            gap8,
            const Tag('Apprenant'),
            gap8,
            const Text('Inscrite le 14 Octobre 2023 • ID: #USR-3842', style: T.caption),
          ]),
        ),
        gap24,
        const Field('Nom', value: 'Martin', prefix: Icons.badge_outlined),
        const Field('Prénom', value: 'Sophie', prefix: Icons.person_outline),
        const Field('E-mail', value: 'sophie.martin@email.fr', prefix: Icons.mail_outline),
        const Field('Mot de passe',
            value: '••••••••••',
            prefix: Icons.lock_outline,
            suffix: Text('Modifier', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: C.primary)),
            helper: 'Laisser vide pour conserver le mot de passe actuel.'),
        const Eyebrow('Rôle'),
        gap8,
        const ChoiceCard('Apprenant',
            subtitle: 'Accès aux cours et examens assignés', icon: Icons.school_outlined, selected: true),
        const ChoiceCard('Administrateur',
            subtitle: 'Accès complet au panneau de gestion', icon: Icons.admin_panel_settings_outlined),
      ],
    );
  }
}
