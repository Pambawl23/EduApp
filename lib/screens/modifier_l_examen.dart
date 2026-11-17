import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class ModifierLExamen extends StatelessWidget {
  const ModifierLExamen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminPage(
      bar: const AdminBar('Édition Examen', actions: [Icons.more_vert]),
      bottom: Column(mainAxisSize: MainAxisSize.min, children: const [
        AppButton('Enregistrer les modifications', icon: Icons.save_outlined),
        AppButton.text('Annuler'),
      ]),
      children: [
        Row(children: const [
          StatusBadge('Publié', Kind.published),
          SizedBox(width: 8),
          Tag('#EXAM-TS-01'),
        ]),
        gap8,
        Row(children: const [
          Icon(Icons.sync, size: 16, color: C.meta),
          SizedBox(width: 4),
          Text('Aujourd\'hui à 11:15 • Dernière synchronisation des métriques en direct', style: T.caption),
        ]),
        gap16,
        AppCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: const [
              Icon(Icons.insights, size: 20, color: C.primary),
              SizedBox(width: 8),
              Expanded(child: Text('Performance & Participation', style: T.h3)),
              StatusBadge('Live', Kind.sent, icon: Icons.bolt),
            ]),
            gap16,
            Row(children: const [
              Expanded(child: _Metric(Icons.group_outlined, '158', 'Participants')),
              Expanded(child: _Metric(Icons.military_tech_outlined, '15.8', '/20 Note moy.')),
              Expanded(child: _Metric(Icons.trending_up, '88.6', '% Réussite')),
            ]),
            gap16,
            const _Split('Succès (140 apprenants)', '88.6%', 0.886, C.success),
            gap12,
            const _Split('Échec / Repassage (18)', '11.4%', 0.114, C.danger),
            gap16,
            const AppButton.secondary('Consulter les 158 copies d\'examen', icon: Icons.assignment_turned_in_outlined),
          ]),
        ),
        gap24,
        const Field('Titre de l\'examen',
            value: 'Évaluation Certifiante : Architecture TypeScript & React', required: true, lines: 2),
        const Field('Formation rattachée',
            value: 'Développement Web Fullstack (#FORM-WEB-01)', required: true, suffix: Icon(Icons.expand_more, color: C.meta)),
        Row(children: const [
          Expanded(child: Field('Seuil réussite (%)', value: '15/20', required: true)),
          SizedBox(width: 12),
          Expanded(child: Field('Durée limite', value: '45 min', required: true, prefix: Icons.schedule)),
        ]),
        const Eyebrow('Tentatives maximales'),
        gap8,
        AppCard(
          child: Row(children: [
            const Expanded(child: Text('Autoriser plusieurs essais', style: T.title)),
            const Icon(Icons.remove_circle_outline, color: C.meta),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('2', style: T.h3)),
            const Icon(Icons.add_circle_outline, color: C.primary),
          ]),
        ),
        gap16,
        const Eyebrow('Structure des questions'),
        gap8,
        AppCard(
          child: Row(children: [
            const IconBox(Icons.quiz_outlined),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                Text('25 questions', style: T.title),
                Text('Total barème : 20.0 points', style: T.caption),
              ]),
            ),
            const Tag('Mix QCM / Code'),
          ]),
        ),
        gap8,
        const AppButton.secondary('Gérer les questions (25)', icon: Icons.arrow_forward),
        gap16,
        const Eyebrow('Statut de publication'),
        gap8,
        const ChoiceCard('Publié', icon: Icons.check_circle_outline, selected: true),
        const ChoiceCard('Brouillon', icon: Icons.edit_document),
        const ChoiceCard('Archivé', icon: Icons.archive_outlined),
      ],
    );
  }
}

class _Metric extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  const _Metric(this.icon, this.value, this.label);
  @override
  Widget build(BuildContext context) => Column(children: [
        Icon(icon, size: 20, color: C.primary),
        const SizedBox(height: 4),
        Text(value, style: T.h2),
        Text(label, style: const TextStyle(fontSize: 11, color: C.meta)),
      ]);
}

class _Split extends StatelessWidget {
  final String label;
  final String value;
  final double v;
  final Color color;
  const _Split(this.label, this.value, this.v, this.color);
  @override
  Widget build(BuildContext context) => Column(children: [
        Row(children: [
          Expanded(child: Text(label, style: T.caption)),
          Text(value, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: color)),
        ]),
        const SizedBox(height: 6),
        ProgressBar(v, color: color),
      ]);
}
