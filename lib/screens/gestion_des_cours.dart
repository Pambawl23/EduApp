import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/app_routes.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class GestionDesCours extends StatelessWidget {
  const GestionDesCours({super.key});

  static const _courses = [
    ('#01', Icons.play_circle_outline, 'Introduction à TypeScript & Configuration', Icons.videocam_outlined, 'Vidéo', '25 min', 'Publié', Kind.published, Icons.groups_outlined, '142 apprenants'),
    ('#02', Icons.picture_as_pdf_outlined, 'Guide d\'installation et aide-mémoire syntaxe', Icons.description_outlined, 'Fiche PDF', '15 min', 'Publié', Kind.published, Icons.download, '2.4 Mo (Téléchargeable)'),
    ('#03', Icons.play_circle_outline, 'Les types fondamentaux et interfaces', Icons.videocam_outlined, 'Vidéo', '45 min', 'Publié', Kind.published, Icons.quiz_outlined, 'Quiz interactif inclus'),
    ('#04', Icons.article_outlined, 'Bonnes pratiques de typage et architecture', Icons.notes, 'Texte interactif', '30 min', 'Brouillon', Kind.draft, Icons.history_edu, 'Modifié il y a 2h'),
    ('#05', Icons.play_circle_outline, 'Déploiement CI/CD et tests automatisés', Icons.videocam_outlined, 'Vidéo', '50 min', 'Archivé', Kind.archived, Icons.inventory_2_outlined, 'Remplacé par module V2'),
  ];

  @override
  Widget build(BuildContext context) {
    return AdminPage(
      bar: const AdminBar('Gestion Des Cours', leading: Icons.school_outlined),
      tabs: const AdminTabs(current: 1, items: [
        (Icons.home_outlined, 'Accueil'),
        (Icons.menu_book_outlined, 'Formations'),
        (Icons.assignment_outlined, 'Examens'),
        (Icons.notifications_outlined, 'Alertes'),
        (Icons.more_horiz, 'Plus'),
      ]),
      bottom: AppButton('Ajouter un cours',
          icon: Icons.add,
          onPressed: () => context.push(AppRoutes.createCourse)),
      children: [
        AppCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: const [
              Icon(Icons.code, size: 16, color: C.primary),
              SizedBox(width: 6),
              Expanded(child: Eyebrow('Formation active', color: C.primary)),
              StatusBadge('Active', Kind.published),
            ]),
            gap8,
            const Text('Développement Web Fullstack', style: T.h2),
            gap8,
            Row(children: const [
              Icon(Icons.auto_stories_outlined, size: 16, color: C.meta),
              SizedBox(width: 4),
              Text('12 modules', style: T.caption),
              SizedBox(width: 12),
              Icon(Icons.schedule, size: 16, color: C.meta),
              SizedBox(width: 4),
              Text('48h au total', style: T.caption),
            ]),
          ]),
        ),
        gap12,
        const InfoBanner('Glissez-déposez les poignées pour réorganiser l\'ordre pédagogique des leçons en temps réel.',
            icon: Icons.drag_indicator),
        const FilterRow(['Tous  12', 'Vidéo  6', 'PDF  3', 'Texte  3']),
        gap16,
        for (final c in _courses)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppCard(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  const Icon(Icons.drag_indicator, color: C.hint),
                  const SizedBox(width: 6),
                  Tag(c.$1),
                  const SizedBox(width: 10),
                  IconBox(c.$2, size: 36),
                  const Spacer(),
                  StatusBadge(c.$7, c.$8),
                ]),
                gap12,
                Text(c.$3, style: T.title),
                gap8,
                Row(children: [
                  Icon(c.$4, size: 14, color: C.meta),
                  const SizedBox(width: 4),
                  Text('${c.$5} • ${c.$6}', style: T.caption),
                ]),
                const Divider(height: 24, color: C.divider),
                Row(children: [
                  Icon(c.$9, size: 14, color: C.meta),
                  const SizedBox(width: 4),
                  Expanded(child: Text(c.$10, style: T.caption, overflow: TextOverflow.ellipsis)),
                  const ActionIcons(
                    [Icons.visibility_outlined, Icons.edit_outlined, Icons.delete_outline],
                    lastColor: C.danger,
                    routes: [
                      AppRoutes.adminCoursePreview,
                      AppRoutes.editCourse,
                      AppRoutes.deleteCourse,
                    ],
                  ),
                ]),
              ]),
            ),
          ),
        const InfoBanner('Enregistré', icon: Icons.check_circle, kind: Kind.published, title: 'Ordre pédagogique mis à jour'),
      ],
    );
  }
}
