import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class CreerUneFormation extends StatelessWidget {
  const CreerUneFormation({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminPage(
      bar: const AdminBar('Détails De Formation'),
      bottom: Column(mainAxisSize: MainAxisSize.min, children: const [
        AppButton('Publier la formation', icon: Icons.publish),
        AppButton.secondary('Enregistrer en brouillon', icon: Icons.bookmark_border),
      ]),
      children: [
        Row(children: [
          const IconBox(Icons.edit_note, size: 44),
          const SizedBox(width: 12),
          const Expanded(child: Eyebrow('Module Curriculum')),
          const Text('Étape 1 sur 2', style: T.caption),
        ]),
        gap8,
        const ProgressBar(0.5),
        gap24,
        Row(children: const [
          Expanded(child: Eyebrow('Image de couverture')),
          Text('Optionnel', style: T.caption),
        ]),
        gap8,
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            color: C.primarySoft,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: C.border),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
            Icon(Icons.add_a_photo_outlined, size: 30, color: C.primary),
            SizedBox(height: 8),
            Text('Ajouter une image de couverture', style: T.title),
            Text('Format PNG, JPG jusqu\'à 5 Mo (16:9 recommandé)', style: T.caption),
          ]),
        ),
        gap24,
        const Field('Titre de la formation', hint: 'ex. Architecture Cloud & DevOps', required: true),
        const Field('Description', hint: 'Décrivez les objectifs et le public visé…', lines: 4, counter: '0 / 500', required: true),
        const Field('Catégorie',
            hint: 'Sélectionner une catégorie (ex. Développement Web, Design, IA...)',
            suffix: Icon(Icons.expand_more, color: C.meta),
            required: true),
        const Eyebrow('Niveau requis'),
        gap8,
        Row(children: const [
          Expanded(child: _Level(Icons.signal_cellular_alt_1_bar, 'Débutant', true)),
          SizedBox(width: 8),
          Expanded(child: _Level(Icons.trending_up, 'Intermédiaire', false)),
          SizedBox(width: 8),
          Expanded(child: _Level(Icons.verified_outlined, 'Avancé', false)),
        ]),
        gap16,
        const Field('Durée estimée (heures)', hint: 'ex. 36h', prefix: Icons.schedule, required: true),
        const InfoBanner('Cette formation génèrera un parcours modulaire conforme aux normes administratives et d\'évaluation continue.',
            icon: Icons.verified_user_outlined, title: 'Certification académique'),
      ],
    );
  }
}

class _Level extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool on;
  const _Level(this.icon, this.label, this.on);
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: on ? C.primarySoft : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: on ? C.primary : C.border, width: on ? 2 : 1),
        ),
        child: Column(children: [
          Icon(icon, size: 22, color: on ? C.primary : C.meta),
          const SizedBox(height: 6),
          Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: on ? C.primary : C.body)),
        ]),
      );
}
