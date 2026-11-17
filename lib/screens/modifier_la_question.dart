import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class ModifierLaQuestion extends StatelessWidget {
  const ModifierLaQuestion({super.key});

  static const _answers = [
    ('A', true, 'Les interfaces permettent la fusion automatique de déclarations (declaration merging) tandis que les types génèrent une erreur de duplication.'),
    ('B', false, 'Les types permettent la fusion automatique, pas les interfaces.'),
    ('C', false, 'Il n\'y a aucune différence, les deux s\'étendent de manière strictement identique à la compilation.'),
    ('D', false, 'Seuls les types peuvent être exportés dans des modules ES6.'),
  ];

  @override
  Widget build(BuildContext context) {
    return AdminPage(
      bar: const AdminBar('Détail Examen', actions: [Icons.more_vert]),
      bottom: Column(mainAxisSize: MainAxisSize.min, children: const [
        AppButton('Enregistrer la question', icon: Icons.save_outlined),
        AppButton.text('Annuler'),
      ]),
      children: [
        Row(children: const [
          Icon(Icons.assignment_outlined, size: 16, color: C.meta),
          SizedBox(width: 6),
          Expanded(child: Text('Examen : Architecture TypeScript & React • Question #01', style: T.caption)),
          Tag('QCM'),
        ]),
        gap16,
        Row(children: const [
          Expanded(child: Eyebrow('Énoncé de la question *')),
          Text('148 / 500 car.', style: T.caption),
        ]),
        gap8,
        AppCard(
          padding: EdgeInsets.zero,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: const BoxDecoration(
                color: C.divider,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Row(children: const [
                Icon(Icons.format_bold, size: 20, color: C.meta),
                SizedBox(width: 12),
                Icon(Icons.format_italic, size: 20, color: C.meta),
                SizedBox(width: 12),
                Icon(Icons.code, size: 20, color: C.meta),
                SizedBox(width: 12),
                Icon(Icons.terminal, size: 20, color: C.meta),
                Spacer(),
                Text('Aperçu direct', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: C.primary)),
              ]),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                  'Quelle est la principale différence entre une Interface et un Type Alias en TypeScript concernant la fusion de déclarations (declaration merging) ?',
                  style: T.body),
            ),
          ]),
        ),
        gap16,
        const Eyebrow('Snippet d\'illustration'),
        gap8,
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: C.heading, borderRadius: BorderRadius.circular(12)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
            Row(children: [
              Icon(Icons.data_object, size: 16, color: Colors.white70),
              SizedBox(width: 6),
              Text('TypeScript', style: TextStyle(fontSize: 12, color: Colors.white70)),
            ]),
            SizedBox(height: 10),
            Text('interface User { name: string; }\ninterface User { role: Role; }\n// declaration merged',
                style: TextStyle(fontFamily: 'monospace', fontSize: 12.5, color: Color(0xFFB2C5FF), height: 1.6)),
          ]),
        ),
        gap24,
        const Eyebrow('Type de question'),
        gap8,
        Row(children: const [
          Expanded(child: _Type(Icons.radio_button_checked, 'Choix unique', true)),
          SizedBox(width: 8),
          Expanded(child: _Type(Icons.check_box_outlined, 'Multiples', false)),
          SizedBox(width: 8),
          Expanded(child: _Type(Icons.flaky, 'Vrai / Faux', false)),
        ]),
        gap24,
        const Eyebrow('Points attribués *'),
        gap8,
        Row(children: const [
          Expanded(child: CounterStepper('4 pts')),
          SizedBox(width: 12),
          Expanded(child: Tag('Coefficient 1.0 • Valeur par défaut')),
        ]),
        const SizedBox(height: 4),
        const Text('Pondération dans la note finale sur 20', style: T.caption),
        gap24,
        const Eyebrow('Propositions de réponses & Bonne réponse *'),
        gap8,
        const Text('Cochez la case "Bonne réponse" correspondant à la réponse exacte.', style: T.caption),
        gap12,
        for (final a in _answers)
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: a.$2 ? C.successSoft : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: a.$2 ? C.success : C.border, width: a.$2 ? 2 : 1),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Avatar(a.$1, size: 28, bg: a.$2 ? C.success : C.hint),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(a.$2 ? 'Bonne réponse • Sélectionnée' : 'Bonne réponse • Optionnel',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: a.$2 ? C.success : C.meta)),
                ),
                Icon(a.$2 ? Icons.check_circle : Icons.radio_button_unchecked, color: a.$2 ? C.success : C.hint),
                const SizedBox(width: 8),
                const Icon(Icons.delete_outline, size: 20, color: C.danger),
              ]),
              gap8,
              Text(a.$3, style: T.bodySm),
            ]),
          ),
        const AppButton.secondary('Ajouter un choix de réponse', icon: Icons.add_circle_outline),
        gap24,
        Row(children: const [
          Expanded(child: Eyebrow('Explication pédagogique (Optionnelle)')),
          Text('Affichée au corrigé', style: T.caption),
        ]),
        gap8,
        const InfoBanner(
            'En TypeScript, redéclarer une interface existante fusionne ses membres, utile pour étendre les librairies tierces.',
            icon: Icons.lightbulb_outline,
            title: 'Conseil d\'apprentissage pour les apprenants'),
        const InfoBanner('Contrôle de validation pédagogique', icon: Icons.verified_outlined, kind: Kind.published),
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
          Icon(icon, size: 22, color: on ? C.primary : C.meta),
          const SizedBox(height: 6),
          Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: on ? C.primary : C.body)),
        ]),
      );
}
