import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class CreerUnCours extends StatelessWidget {
  const CreerUnCours({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminPage(
      bar: const AdminBar('Créer Un Cours'),
      bottom: Column(mainAxisSize: MainAxisSize.min, children: const [
        AppButton('Publier le cours', icon: Icons.cloud_upload_outlined),
        AppButton.secondary('Enregistrer en brouillon', icon: Icons.drafts_outlined),
      ]),
      children: [
        Row(children: [
          const IconBox(Icons.auto_stories_outlined, size: 44),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
              Text('Parcours Pédagogique 2025', style: T.title),
              Text('Ajout d\'une nouvelle unité au cursus', style: T.caption),
            ]),
          ),
          const Tag('Étape 2/3'),
        ]),
        gap24,
        const Field('Titre du module', hint: 'ex. Maîtriser les interfaces et types avancés'),
        const Eyebrow('Type de contenu'),
        gap8,
        Row(children: const [
          Expanded(child: _Type(Icons.play_circle_outline, 'Vidéo', true)),
          SizedBox(width: 8),
          Expanded(child: _Type(Icons.picture_as_pdf_outlined, 'Document PDF', false)),
          SizedBox(width: 8),
          Expanded(child: _Type(Icons.article_outlined, 'Article / Note', false)),
        ]),
        gap16,
        const Field('Contenu et directives',
            hint: 'Décrivez le contenu de la leçon…', lines: 4, counter: '0 / 2 000'),
        const InfoBanner('Les liens vidéo (Vimeo, YouTube Pro) seront formatés automatiquement.', icon: Icons.link),
        Row(children: const [
          Expanded(child: Field('Durée estimée', value: '00:45:00', prefix: Icons.schedule)),
          SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Eyebrow('Position cursus'),
              SizedBox(height: 8),
              CounterStepper('06'),
              SizedBox(height: 16),
            ]),
          ),
        ]),
        const Eyebrow('Statut de publication'),
        gap8,
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(color: C.divider, borderRadius: BorderRadius.circular(12)),
          child: Row(children: [
            for (final s in const ['Brouillon', 'Publié', 'Archivé'])
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: s == 'Brouillon' ? C.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Text(s,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: s == 'Brouillon' ? Colors.white : C.meta)),
                ),
              ),
          ]),
        ),
        gap24,
        Row(children: const [
          Expanded(child: Eyebrow('Ressource attachée')),
          Icon(Icons.sync, size: 16, color: C.primary),
          SizedBox(width: 4),
          Text('Actualiser', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: C.primary)),
        ]),
        gap8,
        const AdminRow(
          leading: IconBox(Icons.movie_outlined),
          title: 'module_06_masterclass.mp4',
          subtitle: '1080p HD • 412 Mo • Prêt',
          trailing: Icon(Icons.check_circle, color: C.success),
        ),
      ],
    );
  }
}

class _Type extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool on;
  const _Type(this.icon, this.label, this.on);
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: on ? C.primarySoft : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: on ? C.primary : C.border, width: on ? 2 : 1),
        ),
        child: Column(children: [
          Icon(icon, size: 24, color: on ? C.primary : C.meta),
          const SizedBox(height: 6),
          Text(label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: on ? C.primary : C.body)),
          const SizedBox(height: 4),
          Icon(on ? Icons.check_circle : Icons.radio_button_unchecked, size: 16, color: on ? C.primary : C.hint),
        ]),
      );
}
