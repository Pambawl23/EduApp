import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/app_routes.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class GestionDesFormations extends StatelessWidget {
  const GestionDesFormations({super.key});

  static const _items = [
    (Icons.terminal, 'Développement Web', 'Développement Web Fullstack', 'Publié', Kind.published, 'Avancé', '48h • 12 modules', '312 inscrits', '(+14 cette semaine)', [Icons.edit_outlined, Icons.delete_outline, Icons.more_vert]),
    (Icons.layers_outlined, 'Design & UX/UI', 'UX/UI Design & Design System', 'Publié', Kind.published, 'Intermédiaire', '32h • 8 modules', '512 inscrits', 'Capacité 85%', [Icons.edit_outlined, Icons.delete_outline, Icons.more_vert]),
    (Icons.psychology_outlined, 'Intelligence Artificielle', 'IA Générative & LLM en Entreprise', 'Brouillon', Kind.draft, 'Tous niveaux', '20h • 6 modules', '0 inscrit (Brouillon)', '', [Icons.edit_outlined, Icons.delete_outline, Icons.more_vert]),
    (Icons.groups_outlined, 'Management', 'Management Agile & Scrum Master', 'Archivé', Kind.archived, 'Débutant', '16h • 5 modules', '190 anciens inscrits', '', [Icons.unarchive_outlined, Icons.delete_forever, Icons.more_vert]),
  ];

  @override
  Widget build(BuildContext context) {
    return AdminPage(
      bar: const AdminBar('Gestion Des Formations', leading: Icons.menu),
      tabs: const AdminTabs(current: 1, items: AdminTabs.standard),
      bottom: AppButton('Créer une formation',
          icon: Icons.add_circle_outline,
          onPressed: () => context.push(AppRoutes.createFormation)),
      children: [
        const SearchBox('Rechercher une formation, un formateur...'),
        gap12,
        const FilterRow(['Tous (26)', 'Publiées (21)', 'Brouillons (2)', 'Archivées (3)']),
        gap16,
        AppCard(
          color: C.primarySoft,
          child: Row(children: [
            const IconBox(Icons.trending_up, bg: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                Eyebrow('Impact Global'),
                Text('1 014', style: T.h2),
                Text('apprenants actifs', style: T.caption),
              ]),
            ),
            const StatusBadge('94% taux réussite', Kind.published, icon: Icons.check_circle),
          ]),
        ),
        gap16,
        for (final f in _items)
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: AppCard(
              padding: EdgeInsets.zero,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  height: 110,
                  decoration: const BoxDecoration(
                    color: C.borderLight,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  ),
                  child: Stack(children: [
                    Center(child: Icon(f.$1, size: 40, color: C.hint)),
                    Positioned(right: 10, top: 10, child: StatusBadge(f.$4, f.$5)),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Eyebrow(f.$2, color: C.primary),
                    const SizedBox(height: 4),
                    Text(f.$3, style: T.h3),
                    gap12,
                    Row(children: [
                      Tag(f.$6),
                      const SizedBox(width: 10),
                      const Icon(Icons.schedule, size: 14, color: C.meta),
                      const SizedBox(width: 4),
                      Text(f.$7, style: T.caption),
                    ]),
                    const Divider(height: 24, color: C.divider),
                    Row(children: [
                      Expanded(
                        child: Text.rich(TextSpan(children: [
                          TextSpan(text: f.$8, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: C.primary)),
                          if (f.$9.isNotEmpty) TextSpan(text: '  ${f.$9}', style: T.caption),
                        ])),
                      ),
                      ActionIcons(f.$10, lastColor: null, routes: const [
                        AppRoutes.adminFormationDetails,
                        AppRoutes.editFormation,
                        AppRoutes.deleteFormation,
                      ]),
                    ]),
                  ]),
                ),
              ]),
            ),
          ),
      ],
    );
  }
}
