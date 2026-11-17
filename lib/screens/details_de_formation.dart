import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class DetailsDeFormation extends StatelessWidget {
  const DetailsDeFormation({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminPage(
      bar: const AdminBar('Détails De Formation'),
      bottom: Row(children: const [
        Expanded(flex: 3, child: AppButton('Modifier la formation', icon: Icons.edit_outlined)),
        SizedBox(width: 10),
        Expanded(flex: 2, child: AppButton.secondary('Options', icon: Icons.tune)),
      ]),
      children: [
        Row(children: const [
          StatusBadge('Publié', Kind.published),
          SizedBox(width: 8),
          Tag('Développement Web'),
        ]),
        gap12,
        const Text('Développement Web Fullstack', style: T.h1),
        gap8,
        Row(children: const [
          Icon(Icons.verified_user_outlined, size: 16, color: C.meta),
          SizedBox(width: 6),
          Expanded(child: Text('Par Thomas Renard • Mis à jour le 12 Mai 2024', style: T.caption)),
        ]),
        gap16,
        Row(children: const [
          Expanded(child: _Mini(Icons.schedule, '48h', 'Durée')),
          SizedBox(width: 8),
          Expanded(child: _Mini(Icons.auto_stories_outlined, '12', 'Modules')),
          SizedBox(width: 8),
          Expanded(child: _Mini(Icons.group_outlined, '312', 'Inscrits')),
          SizedBox(width: 8),
          Expanded(child: _Mini(Icons.star_outline, '4.9', 'Note')),
        ]),
        gap16,
        const FilterRow(['Infos', 'Cours  12', 'Examens  3', 'Inscrits  312']),
        gap16,
        AppCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: const [
              Icon(Icons.lightbulb_outline, size: 20, color: C.primary),
              SizedBox(width: 8),
              Text('Objectifs & Présentation', style: T.h3),
            ]),
            gap12,
            const Text(
                'Ce cursus intensif forme des développeurs complets capables de concevoir, déployer et maintenir des applications web modernes et résilientes. Axé sur les architectures REST, l’intégration cloud et les interfaces réactives.',
                style: T.body),
            gap16,
            const Eyebrow('Compétences visées'),
            gap8,
            Wrap(spacing: 8, runSpacing: 8, children: [
              for (final s in const ['React & Node.js', 'TypeScript', 'Docker & CI/CD', 'PostgreSQL & Prisma'])
                Row(mainAxisSize: MainAxisSize.min, children: [
                  const Icon(Icons.check_circle, size: 16, color: C.success),
                  const SizedBox(width: 4),
                  Text(s, style: T.bodySm),
                ]),
            ]),
          ]),
        ),
        gap16,
        AppCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: const [
              Icon(Icons.account_tree_outlined, size: 20, color: C.primary),
              SizedBox(width: 8),
              Text('Structure pédagogique', style: T.h3),
            ]),
            gap12,
            Row(children: const [
              Expanded(child: _Mini(null, '12', 'Modules')),
              SizedBox(width: 8),
              Expanded(child: _Mini(null, '42', 'Leçons interactives')),
              SizedBox(width: 8),
              Expanded(child: _Mini(null, '6', 'Projets pratiques')),
            ]),
            gap12,
            const InfoBanner('RNCP Niveau 6', icon: Icons.workspace_premium_outlined, title: 'Examen de certification inclus'),
          ]),
        ),
        gap16,
        AppCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: const [
              Icon(Icons.query_stats, size: 20, color: C.primary),
              SizedBox(width: 8),
              Text('Statistiques & Inscriptions', style: T.h3),
            ]),
            gap16,
            const _Bar('Taux moyen de complétion', '78%', 0.78),
            gap12,
            const _Bar('Réussite aux évaluations finales', '89%', 0.89),
            gap12,
            Row(children: const [
              Expanded(child: Text('Apprenants actuellement actifs', style: T.caption)),
              Text('312 étudiants', style: T.title),
            ]),
          ]),
        ),
        gap16,
        const SectionTitle('Derniers Inscrits', action: 'Voir les 312 inscrits >'),
        for (final l in const [
          ('CL', 'Camille Lambert', 'Inscrite il y a 2 jours', '64%'),
          ('AD', 'Alexandre Dumas', 'Inscrit il y a 4 jours', '92%'),
          ('SF', 'Sofia Fassi', 'Inscrite il y a 1 semaine', '41%'),
        ])
          AdminRow(
            leading: Avatar(l.$1),
            title: l.$2,
            subtitle: l.$3,
            trailing: Text(l.$4, style: const TextStyle(fontWeight: FontWeight.w700, color: C.primary)),
          ),
        gap16,
        const SectionTitle('Curriculum Détaillé', action: '+ Module'),
        const Text('12 modules séquentiels validés', style: T.caption),
        gap12,
        for (final m in const [
          ('01', 'Fondations Modernes & TypeScript', '4 leçons • 3h 30m'),
          ('02', 'Architecture Backend & NestJS', '6 leçons • 5h 45m'),
          ('03', 'Applications Front-End Réactives', '8 leçons • 7h 10m'),
        ])
          AdminRow(
            leading: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: C.primarySoft, borderRadius: BorderRadius.circular(8)),
              child: Text(m.$1, style: const TextStyle(fontWeight: FontWeight.w800, color: C.primary)),
            ),
            title: m.$2,
            subtitle: m.$3,
            trailing: const Icon(Icons.chevron_right, color: C.hint),
          ),
        gap16,
        const SectionTitle('Examens & Évaluations', action: 'Planifier'),
        const Text('3 sessions programmées', style: T.caption),
        gap12,
        const AdminRow(
          leading: IconBox(Icons.assignment_turned_in_outlined),
          title: 'QCM Technique d\'Étape 1',
          subtitle: 'Durée : 45 min • 30 questions',
          trailing: StatusBadge('Actif', Kind.published),
        ),
        const AdminRow(
          leading: IconBox(Icons.terminal),
          title: 'Projet Soutenance Finale',
          subtitle: 'Devant jury • 20 Juin 2024',
          trailing: StatusBadge('Planifié', Kind.scheduled),
        ),
        gap16,
        const SectionTitle('Liste Complète (312)', action: 'Session active Printemps 2024'),
        for (final l in const [
          ('CL', 'Camille Lambert', '64% complété'),
          ('AD', 'Alexandre Dumas', '92% complété'),
          ('SF', 'Sofia Fassi', '41% complété'),
          ('MR', 'Marc Roussel', '100% Certifié'),
        ])
          AdminRow(
            leading: Avatar(l.$1),
            title: l.$2,
            subtitle: l.$3,
            trailing: const Icon(Icons.more_vert, color: C.meta),
          ),
      ],
    );
  }
}

class _Mini extends StatelessWidget {
  final IconData? icon;
  final String value;
  final String label;
  const _Mini(this.icon, this.value, this.label);
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: C.border),
        ),
        child: Column(children: [
          if (icon != null) ...[Icon(icon, size: 18, color: C.primary), const SizedBox(height: 4)],
          Text(value, style: T.h3),
          Text(label, style: const TextStyle(fontSize: 10, color: C.meta), textAlign: TextAlign.center),
        ]),
      );
}

class _Bar extends StatelessWidget {
  final String label;
  final String value;
  final double v;
  const _Bar(this.label, this.value, this.v);
  @override
  Widget build(BuildContext context) => Column(children: [
        Row(children: [
          Expanded(child: Text(label, style: T.caption)),
          Text(value, style: T.title),
        ]),
        const SizedBox(height: 6),
        ProgressBar(v),
      ]);
}
