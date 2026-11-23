import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/app_routes.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class GestionDesUtilisateurs extends StatelessWidget {
  const GestionDesUtilisateurs({super.key});

  static const _users = [
    ('SM', 'Sophie Martin', 'Apprenant', 'sophie.martin@email.fr', 'Actif • Connecté il y a 2h'),
    ('LB', 'Lucas Bernard', 'Administrateur', 'lucas.bernard@eduapp.fr', 'Actif • En ligne'),
    ('CD', 'Camille Dubois', 'Apprenant', 'camille.dubois@gmail.com', 'Actif • Connecté hier'),
    ('AR', 'Alexandre Robert', 'Apprenant', 'alexandre.robert@outlook.fr', 'Actif • Connecté il y a 5h'),
    ('TR', 'Thomas Renard', 'Administrateur', 'thomas.renard@eduapp.fr', 'Actif • En ligne'),
  ];

  @override
  Widget build(BuildContext context) {
    return AdminPage(
      bar: const AdminBar('Gestion Des Utilisateurs', leading: Icons.school_outlined),
      tabs: const AdminTabs(current: 2, items: AdminTabs.users),
      bottom: AppButton('Créer un utilisateur',
          icon: Icons.person_add_outlined,
          onPressed: () => context.push(AppRoutes.createUser)),
      children: [
        Row(children: [
          const IconBox(Icons.groups_outlined, size: 44),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
              Eyebrow('Annuaire Académique'),
              Text('3 842 au total', style: T.h2),
            ]),
          ),
        ]),
        gap16,
        const SearchBox('Rechercher par nom, e-mail...'),
        gap12,
        const FilterRow(['Tous  3 842', 'Apprenants  3 828', 'Administrateurs  14', 'Archivés']),
        gap16,
        for (final u in _users)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppCard(
              child: Row(children: [
                Avatar(u.$1, size: 44),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(children: [
                      Flexible(child: Text(u.$2, style: T.title, overflow: TextOverflow.ellipsis)),
                      const SizedBox(width: 8),
                      Tag(u.$3,
                          bg: u.$3 == 'Administrateur' ? C.primarySoft : C.divider,
                          fg: u.$3 == 'Administrateur' ? C.primary : C.meta),
                    ]),
                    Text(u.$4, style: T.caption, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 2),
                    Text(u.$5, style: const TextStyle(fontSize: 11, color: C.success, fontWeight: FontWeight.w600)),
                  ]),
                ),
                const ActionIcons(
                  [Icons.edit_outlined, Icons.delete_outline],
                  lastColor: C.danger,
                  routes: [AppRoutes.editUser, AppRoutes.deleteUser],
                ),
              ]),
            ),
          ),
      ],
    );
  }
}
