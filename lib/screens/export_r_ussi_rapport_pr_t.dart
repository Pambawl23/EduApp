import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class ExportReussiRapportPret extends StatelessWidget {
  const ExportReussiRapportPret({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdminBar('Statistiques Performance', leading: Icons.search, actions: [Icons.tune]),
      bottomNavigationBar: const AdminTabs(current: 3, items: AdminTabs.stats),
      body: Stack(children: [
        // Arrière-plan : aperçu des statistiques
        ListView(padding: const EdgeInsets.all(16), children: [
          Row(children: const [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Eyebrow('Aperçu analytique'),
              Text('Statistiques Globales', style: T.h2),
            ])),
            Tag('30 derniers jours'),
          ]),
          gap16,
          Row(children: const [
            Expanded(child: StatTile(Icons.trending_up, '88.4%', 'Taux de réussite', delta: '+4.2% vs M-1')),
            SizedBox(width: 12),
            Expanded(child: StatTile(Icons.group_outlined, '1,420', 'Inscrits actifs', delta: '+120 apprenants')),
          ]),
          gap16,
          AppCard(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Progression des sessions', style: T.h3),
              const Text('Complétion hebdomadaire des modules', style: T.caption),
              gap16,
              SizedBox(
                height: 90,
                child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  for (final h in const [40.0, 62.0, 55.0, 80.0])
                    Expanded(
                      child: Container(
                        height: h,
                        margin: const EdgeInsets.symmetric(horizontal: 14),
                        decoration: BoxDecoration(color: C.primary, borderRadius: BorderRadius.circular(6)),
                      ),
                    ),
                ]),
              ),
            ]),
          ),
          gap16,
          const SectionTitle('Formations majeures', action: 'Détails'),
          const AdminRow(
            leading: IconBox(Icons.computer),
            title: 'Cybersécurité Fondamentaux',
            subtitle: '348 participants',
            trailing: Text('94%', style: TextStyle(fontWeight: FontWeight.w800, color: C.primary)),
          ),
        ]),
        Positioned.fill(child: Container(color: const Color(0xFF0F172A).withOpacity(0.5))),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const InfoBanner('Rapport prêt au téléchargement !', icon: Icons.check_circle, kind: Kind.published),
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(color: C.successSoft, shape: BoxShape.circle),
                child: const Icon(Icons.picture_as_pdf_outlined, size: 30, color: C.success),
              ),
              gap12,
              const Text.rich(
                TextSpan(children: [
                  TextSpan(text: 'L\'export PDF des 30 derniers jours '),
                  TextSpan(text: '(3.4 Mo) ', style: TextStyle(fontWeight: FontWeight.w700, color: C.heading)),
                  TextSpan(text: 'a été généré avec succès.'),
                ]),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: C.meta, height: 1.45),
              ),
              gap16,
              Row(children: const [
                Expanded(child: Text('Statut du traitement', style: T.caption)),
                Text('100% complété', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: C.success)),
              ]),
              const SizedBox(height: 6),
              const ProgressBar(1, color: C.success),
              gap12,
              Row(children: const [
                Icon(Icons.mark_email_read_outlined, size: 16, color: C.meta),
                SizedBox(width: 6),
                Expanded(child: Text('Une copie a été envoyée à admin@eduapp.fr', style: T.caption)),
              ]),
              gap16,
              const AppButton('Télécharger maintenant', icon: Icons.download),
            ]),
          ),
        ),
      ]),
    );
  }
}
