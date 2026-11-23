import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/app_routes.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class StatistiquesPerformance extends StatelessWidget {
  const StatistiquesPerformance({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminPage(
      bar: const AdminBar('Statistiques Performance', leading: Icons.search, actions: [Icons.tune]),
      tabs: const AdminTabs(current: 3, items: AdminTabs.stats),
      children: [
        Row(children: [
          Expanded(
            child: InkWell(
              onTap: () => context.push(AppRoutes.statisticsPeriod),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: C.border),
                ),
                child: Row(children: const [
                  Icon(Icons.calendar_today, size: 16, color: C.primary),
                  SizedBox(width: 8),
                  Expanded(child: Text('30 derniers jours', style: T.title)),
                  Icon(Icons.expand_more, color: C.meta),
                ]),
              ),
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () => context.push(AppRoutes.exportStatistics),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(color: C.primary, borderRadius: BorderRadius.circular(12)),
              child: Row(children: const [
                Icon(Icons.download, size: 16, color: Colors.white),
                SizedBox(width: 6),
                Text('Exporter', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
              ]),
            ),
          ),
        ]),
        gap8,
        const Wrap(spacing: 8, children: [
          Tag('7 derniers jours', bg: C.divider, fg: C.meta),
          Tag('30 derniers jours'),
          Tag('Trimestre en cours', bg: C.divider, fg: C.meta),
          Tag('Année 2024', bg: C.divider, fg: C.meta),
        ]),
        gap16,
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.3,
          children: const [
            StatTile(Icons.group_outlined, '3 828', 'Total Inscrits', delta: '↗ +12.4%'),
            StatTile(Icons.check_circle_outline, '78.5%', 'Taux Complétion', delta: '↗ +3.2%'),
            StatTile(Icons.military_tech_outlined, '84.5%', 'Taux Réussite', delta: '↗ +1.8%'),
            StatTile(Icons.schedule, '14 250h', 'Heures Suivies', delta: '↗ +18.6%'),
          ],
        ),
        gap16,
        // Courbe des flux
        AppCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Eyebrow('Courbe des Flux'),
            const SizedBox(height: 4),
            Row(children: const [
              Expanded(child: Text('Nouvelles Inscriptions', style: T.h3)),
              Text('426 ce mois', style: T.caption),
            ]),
            gap16,
            SizedBox(
              height: 140,
              child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: const [
                _Col('Sem 1 (65)', 65),
                _Col('Sem 2 (110)', 110),
                _Col('Sem 3 (98)', 98),
                _Col('Sem 4 (153)', 153, highlight: true),
              ]),
            ),
          ]),
        ),
        gap16,
        AppCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Eyebrow('Évaluations'),
            const SizedBox(height: 4),
            const Text('Taux de Réussite aux Examens', style: T.h3),
            gap8,
            Row(children: const [
              Icon(Icons.verified_outlined, size: 14, color: C.success),
              SizedBox(width: 4),
              Text('Seuil de conformité académique : 75.0%', style: T.caption),
            ]),
            gap16,
            for (final r in const [
              ('Dév. Web Fullstack', 88.6),
              ('Design & UX/UI', 91.2),
              ('Intelligence Artificielle', 76.4),
              ('Cybersécurité Appliquée', 82.0),
              ('Cloud & DevOps', 79.5),
            ])
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(children: [
                  Row(children: [
                    Expanded(child: Text(r.$1, style: T.bodySm)),
                    Text('${r.$2}%', style: T.title),
                  ]),
                  const SizedBox(height: 6),
                  ProgressBar(r.$2 / 100, color: r.$2 >= 85 ? C.success : C.primary),
                ]),
              ),
          ]),
        ),
        gap16,
        const Eyebrow('Popularité & Excellence'),
        gap4(),
        Row(children: const [
          Icon(Icons.leaderboard_outlined, size: 20, color: C.primary),
          SizedBox(width: 6),
          Text('Top 5 des Formations', style: T.h3),
        ]),
        gap12,
        for (final t in const [
          ('#1', 'Développement Web Fullstack', '1 240 inscrits', '4.9 ★', '15.8/20'),
          ('#2', 'Design & UX/UI Tokens', '890 inscrits', '4.8 ★', '16.2/20'),
          ('#3', 'Intelligence Artificielle & LLM', '640 inscrits', '4.7 ★', '14.9/20'),
          ('#4', 'Cybersécurité Appliquée', '580 inscrits', '4.9 ★', '15.4/20'),
          ('#5', 'Cloud & DevOps Pipelines', '478 inscrits', '4.6 ★', '15.1/20'),
        ])
          AdminRow(
            leading: Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: C.primarySoft, borderRadius: BorderRadius.circular(8)),
              child: Text(t.$1, style: const TextStyle(fontWeight: FontWeight.w800, color: C.primary)),
            ),
            title: t.$2,
            subtitle: '${t.$3} • ${t.$4} • ${t.$5}',
          ),
        gap24,
        AppCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Eyebrow('Audience'),
            const SizedBox(height: 4),
            Row(children: const [
              Icon(Icons.pie_chart_outline, size: 20, color: C.primary),
              SizedBox(width: 6),
              Text('Répartition par Catégorie', style: T.h3),
            ]),
            gap16,
            Row(children: [
              SizedBox(
                width: 110,
                height: 110,
                child: Stack(alignment: Alignment.center, children: [
                  const SizedBox(
                    width: 110,
                    height: 110,
                    child: CircularProgressIndicator(value: 0.38, strokeWidth: 14, color: C.primary, backgroundColor: C.borderLight),
                  ),
                  Column(mainAxisSize: MainAxisSize.min, children: const [
                    Text('3 828', style: T.h3),
                    Text('Total', style: T.caption),
                  ]),
                ]),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(children: const [
                  _Legend(C.primary, 'Dév. Web (38%)', '1 454'),
                  _Legend(Color(0xFF6B82BE), 'Design UX/UI (25%)', '957'),
                  _Legend(Color(0xFF9FB1DB), 'IA & Data (18%)', '689'),
                  _Legend(C.success, 'Cyber (12%)', '460'),
                  _Legend(C.hint, 'Autres (7%)', '268'),
                ]),
              ),
            ]),
          ]),
        ),
        gap16,
        AppButton('Générer un rapport complet',
            icon: Icons.picture_as_pdf_outlined,
            onPressed: () => context.push(AppRoutes.reportReady)),
        gap12,
        const InfoBanner('Export en cours...', icon: Icons.check_circle, kind: Kind.published),
      ],
    );
  }

  static Widget gap4() => const SizedBox(height: 4);
}

class _Col extends StatelessWidget {
  final String label;
  final double v;
  final bool highlight;
  const _Col(this.label, this.v, {this.highlight = false});
  @override
  Widget build(BuildContext context) => Expanded(
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
            height: v * 0.7,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: highlight ? C.primary : const Color(0xFFB2C5FF),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
            ),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 10, color: C.meta), textAlign: TextAlign.center),
        ]),
      );
}

class _Legend extends StatelessWidget {
  final Color color;
  final String label;
  final String value;
  const _Legend(this.color, this.label, this.value);
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(children: [
          Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
          const SizedBox(width: 8),
          Expanded(child: Text(label, style: T.caption)),
          Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: C.heading)),
        ]),
      );
}
