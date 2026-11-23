import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/app_routes.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class CreerUnExamenEtape2 extends StatelessWidget {
  const CreerUnExamenEtape2({super.key});

  static const _qs = [
    ('#Q01', 'QCM • Choix unique', '4 pts', 'Quelle est la principale différence entre une Interface et un Type Alias en TypeScript concernant la fusion de déclarations ?', Icons.check_circle, 'Les interfaces supportent le declaration merging automatique'),
    ('#Q02', 'QCM • Choix multiples', '5 pts', 'Parmi les propositions suivantes, lesquelles déclenchent un re-render complet d\'un composant fonctionnel React ?', Icons.task_alt, '2 bonnes réponses définies'),
    ('#Q03', 'Vrai / Faux', '3 pts', 'Le hook useMemo garantit une optimisation de mémoire sans aucun coût d\'exécution supplémentaire.', Icons.check_circle, 'Faux'),
    ('#Q04', 'QCM • Choix unique', '4 pts', 'Quel pattern architectural Redux Toolkit remplace les action creators et reducers manuels ?', Icons.check_circle, 'createSlice()'),
    ('#Q05', 'QCM • Choix unique', '4 pts', 'Comment typer une promesse retournant un tableau d\'utilisateurs en TypeScript strict ?', Icons.check_circle, 'Promise<User[]>'),
  ];

  @override
  Widget build(BuildContext context) {
    return AdminPage(
      bar: const AdminBar('Création Examen Étape 2', actions: [Icons.more_vert]),
      bottom: Column(mainAxisSize: MainAxisSize.min, children: [
        AppButton('Publier l\'examen certifiant',
            icon: Icons.verified_outlined,
            onPressed: () => context.push(AppRoutes.examPreview)),
        AppButton.secondary('Précédent (Étape 1)',
            icon: Icons.arrow_back,
            onPressed: () => context.canPop()
                ? context.pop()
                : context.go(AppRoutes.adminExams)),
      ]),
      children: [
        Row(children: const [
          Expanded(child: Text('Configuration finale', style: T.h2)),
          Text('Étape 2 sur 2', style: T.caption),
        ]),
        gap8,
        const ProgressBar(1),
        gap16,
        AppCard(
          child: Row(children: [
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                Text('Gestion des questions', style: T.h3),
                SizedBox(height: 4),
                Text('5 questions configurées • Durée : 45 min', style: T.caption),
              ]),
            ),
            Column(children: const [
              Eyebrow('Barème Global'),
              Text('20 / 20 pts', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: C.primary)),
            ]),
          ]),
        ),
        gap12,
        const InfoBanner('Glissez-déposez les poignées pour réordonner les questions dans l\'examen.', icon: Icons.drag_indicator),
        for (final q in _qs)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppCard(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  const Icon(Icons.drag_indicator, color: C.hint),
                  const SizedBox(width: 6),
                  Tag(q.$1),
                  const SizedBox(width: 8),
                  Expanded(child: Text(q.$2, style: T.caption)),
                  Tag(q.$3, bg: C.successSoft, fg: C.success),
                ]),
                gap12,
                Text(q.$4, style: T.title),
                gap8,
                Row(children: [
                  Icon(q.$5, size: 16, color: C.success),
                  const SizedBox(width: 6),
                  Expanded(child: Text(q.$6, style: const TextStyle(fontSize: 12, color: C.success, fontWeight: FontWeight.w600))),
                ]),
                const Divider(height: 24, color: C.divider),
                Row(children: const [
                  Icon(Icons.edit_outlined, size: 16, color: C.primary),
                  SizedBox(width: 4),
                  Text('Modifier', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: C.primary)),
                  Spacer(),
                  Icon(Icons.delete_outline, size: 16, color: C.danger),
                  SizedBox(width: 4),
                  Text('Supprimer', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: C.danger)),
                ]),
              ]),
            ),
          ),
        const AppButton.secondary('Ajouter une question', icon: Icons.add),
      ],
    );
  }
}
