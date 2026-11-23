import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/app_routes.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class CreerUneNotification extends StatelessWidget {
  const CreerUneNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminPage(
      bar: const AdminBar('Nouvelle Notification', leading: Icons.chevron_left, actions: [Icons.more_vert]),
      bottom: Column(mainAxisSize: MainAxisSize.min, children: [
        AppButton('Continuer vers la planification',
            icon: Icons.arrow_forward,
            onPressed: () => context.push(AppRoutes.scheduleNotification)),
        AppButton.secondary('Enregistrer comme brouillon', icon: Icons.bookmark_border),
      ]),
      children: [
        Row(children: const [
          Expanded(child: Text('Étape 1 sur 2', style: T.caption)),
          Tag('Canal Direct Push & In-App'),
        ]),
        gap8,
        const ProgressBar(0.5),
        gap16,
        const Text('Rédiger la diffusion', style: T.h2),
        const Text('Configurez le message diffusé instantanément sur les mobiles des apprenants.', style: T.caption),
        gap16,
        const Field('Titre de la notification',
            value: 'Nouveau cours disponible : Hooks avancés React', counter: '48 / 65', required: true),
        const Field('Message de la notification',
            value: 'Le module 4 sur useCallback et useMemo vient d\'être mis en ligne. Découvrez les bonnes pratiques de performance dès maintenant !',
            lines: 4,
            counter: '135 / 200',
            required: true),
        const Eyebrow('Type de notification *'),
        gap8,
        Row(children: const [
          Expanded(child: _TypeTile(Icons.info_outline, 'Info', true)),
          SizedBox(width: 8),
          Expanded(child: _TypeTile(Icons.notifications_active_outlined, 'Rappel', false)),
          SizedBox(width: 8),
          Expanded(child: _TypeTile(Icons.warning_amber_rounded, 'Alerte', false)),
        ]),
        gap24,
        const Eyebrow('Cible des destinataires *'),
        gap8,
        const ChoiceCard('Tous les apprenants',
            subtitle: 'Base globale active', icon: Icons.groups_outlined, trailing: Tag('3 828 actifs')),
        const ChoiceCard('Une formation spécifique',
            subtitle: 'Ciblage par cohorte de cours', icon: Icons.menu_book_outlined, selected: true, trailing: Tag('312 inscrits')),
        const Field('Formation', value: 'Développement Web Fullstack • 312 inscrits', suffix: Icon(Icons.expand_more, color: C.meta)),
        const ChoiceCard('Un utilisateur précis',
            subtitle: 'Envoi nominatif individuel', icon: Icons.person_search),
        gap16,
        Row(children: const [
          Icon(Icons.smartphone, size: 18, color: C.primary),
          SizedBox(width: 6),
          Expanded(child: Eyebrow('Aperçu push en direct')),
          StatusBadge('Temps réel', Kind.published),
        ]),
        gap12,
        // Aperçu d'écran verrouillé
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: C.heading, borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            Row(children: const [
              Icon(Icons.lock, size: 14, color: Colors.white70),
              SizedBox(width: 6),
              Text('Verrouillé', style: TextStyle(fontSize: 12, color: Colors.white70)),
              Spacer(),
              Text('09:42', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white)),
            ]),
            gap12,
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: const [
                  IconBox(Icons.school_outlined, size: 22),
                  SizedBox(width: 6),
                  Text('EDUAPP', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: C.primary)),
                  Text('  •  Il y a 1 min', style: T.caption),
                ]),
                gap8,
                Row(children: const [
                  Icon(Icons.info_outline, size: 14, color: C.info),
                  SizedBox(width: 4),
                  Text('Info', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: C.info)),
                ]),
                const SizedBox(height: 4),
                const Text('Nouveau cours disponible : Hooks avancés React', style: T.title),
                const SizedBox(height: 2),
                const Text('Le module 4 sur useCallback et useMemo vient d\'être mis en ligne. Découvrez les bonnes pratiques de performance dès maintenant !',
                    style: T.caption),
                gap8,
                const Text('Cible : Développement Web (312)', style: TextStyle(fontSize: 11, color: C.primary, fontWeight: FontWeight.w600)),
              ]),
            ),
            gap12,
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
              Text('Glisser pour ouvrir', style: TextStyle(fontSize: 12, color: Colors.white54)),
              Icon(Icons.chevron_right, size: 16, color: Colors.white54),
            ]),
          ]),
        ),
      ],
    );
  }
}

class _TypeTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool on;
  const _TypeTile(this.icon, this.label, this.on);
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: on ? C.primarySoft : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: on ? C.primary : C.border, width: on ? 2 : 1),
        ),
        child: Column(children: [
          Icon(icon, size: 22, color: on ? C.primary : C.meta),
          const SizedBox(height: 6),
          Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: on ? C.primary : C.body)),
        ]),
      );
}
