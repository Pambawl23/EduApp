import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class ApercuDeLExamen extends StatelessWidget {
  const ApercuDeLExamen({super.key});

  static const _opts = [
    ('A.', false, 'La valeur affichée est 1 car seule la première mutation s\'exécute.'),
    ('B.', true, 'La valeur affichée est 3 car les mises à jour fonctionnelles s\'enchaînent séquentiellement.'),
    ('C.', false, 'La valeur est 2 car les batch updates écrasent les fonctions de rappel.'),
    ('D.', false, 'Une erreur d\'exécution asynchrone est levée dans le strict mode.'),
  ];

  @override
  Widget build(BuildContext context) {
    return AdminPage(
      bar: const AdminBar('Aperçu Et Validation Examen', actions: [Icons.more_vert]),
      bottom: Column(mainAxisSize: MainAxisSize.min, children: [
        Row(children: const [
          Expanded(child: AppButton.secondary('Précédente', icon: Icons.arrow_back)),
          SizedBox(width: 10),
          Expanded(child: AppButton('Suivante', icon: Icons.arrow_forward)),
        ]),
        const AppButton.secondary('Terminer et soumettre l\'examen', icon: Icons.task_alt),
      ]),
      children: [
        const InfoBanner('• Sans impact sur les statistiques', icon: Icons.visibility_outlined, title: 'Mode Simulation Apprenant'),
        Row(children: [
          const Tag('Aperçu'),
          const SizedBox(width: 8),
          const Expanded(child: Text('Architecture TypeScript & React', style: T.caption, overflow: TextOverflow.ellipsis)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(color: C.dangerSoft, borderRadius: BorderRadius.circular(9999)),
            child: Row(children: const [
              Icon(Icons.timer_outlined, size: 14, color: C.danger),
              SizedBox(width: 4),
              Text('38:42', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: C.danger)),
            ]),
          ),
        ]),
        gap12,
        Row(children: const [
          Text.rich(TextSpan(children: [
            TextSpan(text: 'Question 3', style: T.h2),
            TextSpan(text: ' / 25', style: T.caption),
          ])),
          Spacer(),
          Text('Tentative 1 sur 2', style: T.caption),
        ]),
        gap8,
        Row(children: const [
          Tag('4 Points'),
          SizedBox(width: 8),
          Tag('Choix unique'),
          Spacer(),
          Icon(Icons.bookmark_border, size: 18, color: C.meta),
          SizedBox(width: 4),
          Text('Réviser plus tard', style: T.caption),
        ]),
        gap16,
        const Text(
            'Considérez le composant React suivant utilisant un état local et un hook personnalisé. Quelle est la valeur finale affichée après deux clics successifs si les mises à jour sont groupées (batched updates) ?',
            style: T.body),
        gap16,
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: C.heading, borderRadius: BorderRadius.circular(12)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
            Row(children: [
              Expanded(child: Text('TypeScript / TSX', style: TextStyle(fontSize: 12, color: Colors.white70))),
              Icon(Icons.code, size: 16, color: Colors.white70),
            ]),
            SizedBox(height: 10),
            Text('const [count, setCount] = useState(0);\nconst handleClick = () => {\n  setCount(prev => prev + 1);\n  setCount(prev => prev + 2);\n};',
                style: TextStyle(fontFamily: 'monospace', fontSize: 12.5, color: Color(0xFFB2C5FF), height: 1.6)),
          ]),
        ),
        gap24,
        for (final o in _opts)
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: o.$2 ? C.primarySoft : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: o.$2 ? C.primary : C.border, width: o.$2 ? 2 : 1),
            ),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(o.$1, style: TextStyle(fontWeight: FontWeight.w800, color: o.$2 ? C.primary : C.meta)),
              const SizedBox(width: 10),
              Expanded(child: Text(o.$3, style: T.bodySm)),
              if (o.$2) const Icon(Icons.check_circle, size: 20, color: C.primary),
            ]),
          ),
        Row(children: const [
          Icon(Icons.restart_alt, size: 16, color: C.primary),
          SizedBox(width: 4),
          Text('Effacer mon choix', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: C.primary)),
        ]),
        gap24,
        AppCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Feuille de réponses', style: T.h3),
            const SizedBox(height: 2),
            const Text('2 complétées • 23 restantes', style: T.caption),
            gap12,
            Row(children: [
              for (var i = 1; i <= 5; i++)
                Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(right: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: i == 3 ? C.primary : (i < 3 ? C.successSoft : Colors.white),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: i == 3 ? C.primary : (i < 3 ? C.successBorder : C.border)),
                  ),
                  child: Text('$i',
                      style: TextStyle(fontWeight: FontWeight.w700, color: i == 3 ? Colors.white : (i < 3 ? C.success : C.body))),
                ),
            ]),
          ]),
        ),
      ],
    );
  }
}
