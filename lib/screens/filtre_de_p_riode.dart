import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class FiltreDePeriode extends StatelessWidget {
  const FiltreDePeriode({super.key});

  @override
  Widget build(BuildContext context) {
    // Calendrier de Mai 2024 (affiché Lun → Dim)
    const days = [
      29, 30, 1, 2, 3, 4, 5,
      6, 7, 8, 9, 10, 11, 12,
      13, 14, 15, 16, 17, 18, 19,
      20, 21, 22, 23, 24, 25, 26,
    ];
    return DialogPage(
      bar: const AdminBar('Filtre Période', actions: [Icons.close]),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          const IconBox(Icons.date_range, size: 40),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
              Text('Filtrer par période', style: T.h2),
              Text('Ajustez l\'analyse académique', style: T.caption),
            ]),
          ),
          const Icon(Icons.close, color: C.meta),
        ]),
        gap16,
        Row(children: const [
          Expanded(child: Eyebrow('Périodes prédéfinies')),
          StatusBadge('Temps réel', Kind.published),
        ]),
        gap8,
        const ChoiceCard('7 derniers jours', subtitle: 'Du 08 au 15 Mai 2024'),
        const ChoiceCard('30 derniers jours',
            subtitle: 'Du 15 Avril au 15 Mai 2024', selected: true, trailing: StatusBadge('Recommandé', Kind.scheduled)),
        const ChoiceCard('3 derniers mois', subtitle: 'Du 15 Février au 15 Mai 2024'),
        const ChoiceCard('Année en cours (2024)', subtitle: 'Depuis le 1er Janvier 2024'),
        const ChoiceCard('Personnalisé', subtitle: 'Définir des dates exactes', icon: Icons.edit_calendar_outlined),
        gap12,
        Row(children: const [
          Expanded(child: Text('Plage personnalisée active', style: T.title)),
          Tag('31 jours'),
        ]),
        gap12,
        Row(children: const [
          Expanded(child: Field('Date de début', value: '15/04/2024', prefix: Icons.calendar_today)),
          SizedBox(width: 12),
          Expanded(child: Field('Date de fin', value: '15/05/2024', prefix: Icons.event)),
        ]),
        Row(children: const [
          Icon(Icons.chevron_left, color: C.meta),
          Expanded(child: Center(child: Text('Mai 2024', style: T.h3))),
          Icon(Icons.chevron_right, color: C.meta),
        ]),
        gap12,
        Row(children: [
          for (final d in const ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'])
            Expanded(child: Center(child: Text(d, style: T.eyebrow))),
        ]),
        const SizedBox(height: 6),
        for (var r = 0; r < 4; r++)
          Row(children: [
            for (var c = 0; c < 7; c++)
              Expanded(
                child: Builder(builder: (_) {
                  final i = r * 7 + c;
                  final d = days[i];
                  final other = (r == 0 && i < 2);
                  final inRange = (r == 0 && i >= 2) || r == 1 || (r == 2 && i <= 16);
                  final end = r == 2 && c == 2; // 15
                  return Container(
                    height: 36,
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: end ? C.primary : (inRange && !other ? C.primarySoft : Colors.transparent),
                      borderRadius: BorderRadius.circular(end ? 18 : 6),
                    ),
                    child: Text('$d',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: end ? FontWeight.w800 : FontWeight.w500,
                            color: end ? Colors.white : (other ? C.hint : (inRange ? C.primary : C.body)))),
                  );
                }),
              ),
          ]),
        gap12,
        const Row(children: [
          Icon(Icons.schedule, size: 14, color: C.meta),
          SizedBox(width: 4),
          Expanded(child: Text('Aujourd\'hui (15 Mai) • Mise à jour à 14h30', style: T.caption)),
        ]),
        gap16,
        const AppButton('Appliquer la période', icon: Icons.check),
        const AppButton.text('Réinitialiser aux 30 derniers jours', icon: Icons.restart_alt),
      ]),
    );
  }
}
