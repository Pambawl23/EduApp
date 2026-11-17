import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class ExporterLesStatistiques extends StatelessWidget {
  const ExporterLesStatistiques({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogPage(
      bar: const AdminBar('Exporter Rapports', actions: [Icons.close]),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
              Eyebrow('Extraction & Partage'),
              SizedBox(height: 4),
              Text('Exporter les rapports d\'analyse', style: T.h2),
              Text('Configurez et téléchargez les données d\'apprentissage', style: T.caption),
            ]),
          ),
          const Icon(Icons.close, color: C.meta),
        ]),
        gap16,
        const Eyebrow('Format du fichier'),
        gap8,
        const ChoiceCard('PDF (.pdf)',
            subtitle: 'Rapport visuel stylisé prêt à imprimer avec graphiques clés',
            icon: Icons.picture_as_pdf_outlined,
            selected: true),
        const ChoiceCard('Excel (.xlsx)',
            subtitle: 'Tableurs dynamiques avec formules, segments et onglets détaillés', icon: Icons.table_chart_outlined),
        const ChoiceCard('CSV (.csv)',
            subtitle: 'Données tabulaires brutes optimisées pour intégrations BI et ETL', icon: Icons.dataset_outlined),
        gap8,
        const Eyebrow('Période concernée'),
        gap8,
        const Field('30 derniers jours (15 Avr - 15 Mai 2024)',
            hint: '', value: 'Période d\'activité glissante', prefix: Icons.calendar_today, suffix: Icon(Icons.expand_more, color: C.meta)),
        Row(children: const [
          Expanded(child: Eyebrow('Indicateurs à inclure')),
          Text('Tout décocher', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: C.primary)),
        ]),
        gap8,
        for (final i in const [
          (Icons.person_add_outlined, 'Nouvelles inscriptions & abandons', true),
          (Icons.school_outlined, 'Taux de réussite et notes aux examens', true),
          (Icons.trending_up, 'Progression détaillée par formation (Top 5)', true),
          (Icons.pie_chart_outline, 'Répartition par catégorie pédagogique', true),
          (Icons.admin_panel_settings_outlined, 'Coordonnées nominatives des apprenants', false),
        ])
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(children: [
              Icon(i.$1, size: 20, color: C.meta),
              const SizedBox(width: 10),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(i.$2, style: T.bodySm),
                  if (!i.$3)
                    const Text('CONFORMITÉ RGPD REQUISE',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: C.danger)),
                ]),
              ),
              Icon(i.$3 ? Icons.check_box : Icons.check_box_outline_blank, color: i.$3 ? C.primary : C.hint),
            ]),
          ),
        gap8,
        AppCard(
          child: Row(children: [
            const IconBox(Icons.alternate_email, size: 36),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                Text('Copie automatique par email', style: T.title),
                Text('admin@eduapp.fr', style: T.caption),
              ]),
            ),
            Switch(value: true, onChanged: (_) {}, activeColor: Colors.white, activeTrackColor: C.primary),
          ]),
        ),
        gap16,
        const AppButton('Exporter le rapport', icon: Icons.download),
        const AppButton.secondary('Annuler'),
      ]),
    );
  }
}
