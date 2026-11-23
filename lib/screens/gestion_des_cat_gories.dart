import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/app_routes.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class GestionDesCategories extends StatelessWidget {
  const GestionDesCategories({super.key});

  static const _cats = [
    (Icons.terminal, 'Développement Web', 'CAT-WEB-01',
        'Parcours complets sur les technologies web frontend, backend et architectures logicielles modernes, de TypeScript à GraphQL.', '12 formations'),
    (Icons.draw_outlined, 'Design & UX/UI', 'CAT-DSN-04',
        'Conception d\'interfaces utilisateurs intuitives, recherche qualitative, design systems avancés et prototypage interactif sous Figma.', '8 formations'),
    (Icons.psychology_outlined, 'Intelligence Artificielle', 'CAT-AIM-08',
        'Modèles LLM, ingénierie de prompts opérationnelle, Machine Learning fondamental et intégration d\'API prédictives en entreprise.', '5 formations'),
    (Icons.security, 'Cybersécurité', 'CAT-SEC-02',
        'Sensibilisation aux menaces contemporaines, audit de vulnérabilités web, sécurisation des réseaux d\'infrastructure et conformité RGPD.', '4 formations'),
    (Icons.groups_outlined, 'Management & Agilité', 'CAT-MGT-09',
        'Postures managériales, animation des rituels Scrum/Kanban, leadership bienveillant et communication assertive inter-équipes.', '6 formations'),
    (Icons.cloud_sync_outlined, 'Cloud & DevOps', 'CAT-CLD-05',
        'Pipelines d\'intégration continue CI/CD, conteneurisation Docker, orchestration Kubernetes et gestion d\'environnements AWS/GCP.', '5 formations'),
  ];

  @override
  Widget build(BuildContext context) {
    return AdminPage(
      bar: const AdminBar('Formations Et Catégories', leading: Icons.menu),
      tabs: const AdminTabs(current: 1, items: AdminTabs.standard),
      bottom: AppButton.secondary('Créer une catégorie',
          icon: Icons.add_circle_outline,
          onPressed: () => context.push(AppRoutes.createCategory)),
      children: [
        AppCard(
          child: Row(children: [
            const IconBox(Icons.category_outlined, size: 44),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                Eyebrow('Catalogue Pédagogique'),
                Text('8 Catégories', style: T.h2),
                Text('26 formations actives réparties', style: T.caption),
              ]),
            ),
            const StatusBadge('Synchronisé', Kind.published),
          ]),
        ),
        gap16,
        const SearchBox('Rechercher une catégorie...', trailing: Icons.close),
        gap12,
        Row(children: const [
          Expanded(child: Text('Affichage de 6 catégories principales', style: T.caption)),
          Icon(Icons.swap_vert, size: 16, color: C.meta),
          SizedBox(width: 4),
          Text('Ordre alphabétique', style: T.caption),
        ]),
        gap12,
        for (final c in _cats)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppCard(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  IconBox(c.$1),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(c.$2, style: T.title),
                      Text('ID : ${c.$3}', style: T.caption),
                    ]),
                  ),
                  const ActionIcons(
                    [Icons.edit_outlined, Icons.delete_outline],
                    lastColor: C.danger,
                    routes: [AppRoutes.editCategory, AppRoutes.deleteCategory],
                  ),
                ]),
                gap12,
                Text(c.$4, style: T.bodySm),
                gap12,
                Row(children: [
                  const Icon(Icons.menu_book_outlined, size: 16, color: C.primary),
                  const SizedBox(width: 6),
                  Text(c.$5, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: C.primary)),
                  const Spacer(),
                  const StatusBadge('Actif', Kind.published),
                ]),
              ]),
            ),
          ),
      ],
    );
  }
}
