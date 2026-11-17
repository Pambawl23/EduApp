import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class GestionDesExamens extends StatelessWidget {
  const GestionDesExamens({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminPage(
      bar: const AdminBar('Gestion Des Examens', leading: Icons.school_outlined, actions: [Icons.search]),
      tabs: const AdminTabs(current: 2, items: AdminTabs.standard),
      children: [
        Row(children: const [
          Expanded(child: Eyebrow('Session Académique 2024–2025')),
          StatusBadge('En direct', Kind.published),
        ]),
        gap12,
        Row(children: const [
          Expanded(child: StatTile(Icons.assignment_outlined, '18', 'ACTIFS')),
          SizedBox(width: 8),
          Expanded(child: StatTile(Icons.groups_outlined, '1 420', 'PASSATIONS')),
          SizedBox(width: 8),
          Expanded(child: StatTile(Icons.verified_outlined, '84.5%', 'RÉUSSITE')),
        ]),
        gap8,
        Row(children: const [
          Icon(Icons.trending_up, size: 16, color: C.success),
          SizedBox(width: 4),
          Expanded(child: Text('+4.2% ce mois par rapport aux cibles', style: T.caption)),
          Tag('Cohorte A & B'),
        ]),
        gap16,
        const SearchBox('Rechercher un examen, une formation...', trailing: Icons.cancel),
        gap12,
        const FilterRow(['Tous  18', 'Publiés  14', 'Brouillons  3', 'Archivés  1']),
        gap12,
        const AppButton('+ Créer un examen'),
        gap16,
        Row(children: const [
          Expanded(child: Text('Évaluations configurées  3', style: T.h3)),
          Icon(Icons.swap_vert, size: 16, color: C.meta),
          Text(' Tri récent', style: T.caption),
        ]),
        gap12,
        const _Exam(Icons.terminal, 'Développement Web Fullstack', 'Publié', Kind.published,
            'Évaluation Certifiante : Architecture TypeScript & React', 'Validation des acquis de niveau avancé • Module 4',
            '25 questions', 'Réussite : 75%', 'Durée : 45 min', 'Tentatives : 2 max',
            '158 participants', 'Note moy. 15.8/20 • Taux 88%', 'Cohorte active', 'Màj il y a 2 jours'),
        const _Exam(Icons.palette_outlined, 'UX/UI Design & Systems', 'Publié', Kind.published,
            'Examen Final : Principes Heuristiques & Design Tokens', 'Projet d\'évaluation transversale • Certificat Professionnel',
            '30 questions', 'Réussite : 80%', 'Durée : 60 min', 'Tentatives : 1 max',
            '112 participants', 'Note moy. 14.2/20 • Taux 81%', 'Session clôturée', 'Màj le 14 mai'),
        const _Exam(Icons.psychology_outlined, 'Intelligence Artificielle & LLM', 'Brouillon', Kind.draft,
            'QCM d\'Évaluation : Fine-tuning & RAG Pipeline', 'Conception pédagogique en relecture par le comité académique',
            '15 questions', 'Réussite : 70%', 'Durée : 30 min', 'Tentatives : 3 max',
            '0 participant', 'Brouillon en cours de révision', 'Non planifié', 'Créé hier à 17:30'),
      ],
    );
  }
}

class _Exam extends StatelessWidget {
  final IconData icon;
  final String formation, status, title, subtitle, q, pass, duration, tries, participants, stats, cohort, updated;
  final Kind kind;
  const _Exam(this.icon, this.formation, this.status, this.kind, this.title, this.subtitle, this.q, this.pass,
      this.duration, this.tries, this.participants, this.stats, this.cohort, this.updated);

  Widget _meta(IconData i, String t) => Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(i, size: 14, color: C.meta),
        const SizedBox(width: 4),
        Text(t, style: T.caption),
      ]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: AppCard(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Icon(icon, size: 16, color: C.primary),
            const SizedBox(width: 6),
            Expanded(child: Eyebrow(formation, color: C.primary)),
            StatusBadge(status, kind),
          ]),
          gap8,
          Text(title, style: T.h3),
          const SizedBox(height: 4),
          Text(subtitle, style: T.caption),
          gap12,
          Wrap(spacing: 14, runSpacing: 8, children: [
            _meta(Icons.description_outlined, q),
            _meta(Icons.check_circle_outline, pass),
            _meta(Icons.schedule, duration),
            _meta(Icons.replay, tries),
          ]),
          gap12,
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: C.primarySoft, borderRadius: BorderRadius.circular(10)),
            child: Row(children: [
              const Icon(Icons.person_outline, size: 18, color: C.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(participants, style: T.title),
                  Text(stats, style: T.caption),
                ]),
              ),
              Tag(cohort, bg: Colors.white),
            ]),
          ),
          const Divider(height: 24, color: C.divider),
          Row(children: [
            const Icon(Icons.history, size: 14, color: C.hint),
            const SizedBox(width: 4),
            Expanded(child: Text(updated, style: T.caption)),
            const ActionIcons([Icons.visibility_outlined, Icons.edit_outlined, Icons.delete_outline], lastColor: C.danger),
          ]),
        ]),
      ),
    );
  }
}
