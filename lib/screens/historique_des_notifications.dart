import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class HistoriqueDesNotifications extends StatelessWidget {
  const HistoriqueDesNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminPage(
      bar: const AdminBar('Notifications', leading: Icons.school_outlined, actions: [Icons.search, Icons.filter_list]),
      tabs: const AdminTabs(current: 3, items: AdminTabs.standard),
      bottom: const AppButton('Nouvelle notification', icon: Icons.add_circle_outline),
      children: [
        AppCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: const [
              Icon(Icons.insights, size: 18, color: C.primary),
              SizedBox(width: 6),
              Expanded(child: Text('Vue d\'ensemble', style: T.h3)),
              Text('30 derniers jours', style: T.caption),
            ]),
            gap12,
            Row(children: const [
              Expanded(child: _Kpi('148', 'Envoyées')),
              Expanded(child: _Kpi('82.4%', 'Lecture moy.')),
              Expanded(child: _Kpi('3', 'Planifiées')),
            ]),
          ]),
        ),
        gap16,
        const SearchBox('Rechercher une notification...'),
        gap12,
        const FilterRow(['Toutes  148', 'Envoyées  132', 'Planifiées  3', 'Brouillons  13']),
        gap8,
        const FilterRow(['Types', 'Tous', 'Info', 'Rappel', 'Alerte']),
        gap16,
        const _Notif(
          icon: Icons.info_outline, type: 'Info', date: '14 Mai • 10:30', status: 'Envoyée', kind: Kind.sent,
          title: 'Nouvel examen certifiant disponible !', targetIcon: Icons.school_outlined,
          target: 'Formation Web Fullstack (#FORM-WEB-01)', l1: '312 destinataires', l2: 'Taux de lecture : 88%',
          footer: 'Canal : Push & In-App', actions: [Icons.content_copy, Icons.visibility_outlined],
        ),
        const _Notif(
          icon: Icons.alarm, type: 'Rappel', date: '12 Mai • 08:00', status: 'Envoyée', kind: Kind.sent,
          title: 'Rappel : Clôture de l\'examen TypeScript ce soir', targetIcon: Icons.groups_outlined,
          target: 'Tous les apprenants actifs', l1: '3 828 destinataires', l2: 'Taux de lecture : 94%',
          footer: 'Canal : Push Urgent', actions: [Icons.content_copy, Icons.visibility_outlined],
        ),
        const _Notif(
          icon: Icons.warning_amber_rounded, type: 'Alerte', date: 'Dans 6 jours', status: 'Planifiée', kind: Kind.scheduled,
          title: 'Maintenance programmée de la plateforme', targetIcon: Icons.public,
          target: 'Tous les utilisateurs plateforme', l1: 'Prévue le 20 Mai à 23:00', l2: 'Cible estimée : 3 842 utilisateurs',
          footer: 'Déclencheur automatique', actions: [Icons.edit_outlined, Icons.more_vert],
        ),
        const _Notif(
          icon: Icons.drafts_outlined, type: 'Info', date: 'Modifié hier', status: 'Brouillon', kind: Kind.draft,
          title: 'Bienvenue dans le cursus Cloud DevOps', targetIcon: Icons.person_outline,
          target: 'Sophie Martin (Apprenante individuelle)', l1: 'Contenu rédigé à 85%', l2: 'En attente de validation',
          footer: 'Non diffusée', actions: [Icons.delete_outline, Icons.edit_note],
        ),
      ],
    );
  }
}

class _Kpi extends StatelessWidget {
  final String value;
  final String label;
  const _Kpi(this.value, this.label);
  @override
  Widget build(BuildContext context) => Column(children: [
        Text(value, style: T.h2),
        Text(label, style: T.caption),
      ]);
}

class _Notif extends StatelessWidget {
  final IconData icon, targetIcon;
  final String type, date, status, title, target, l1, l2, footer;
  final Kind kind;
  final List<IconData> actions;
  const _Notif({
    required this.icon, required this.type, required this.date, required this.status, required this.kind,
    required this.title, required this.targetIcon, required this.target, required this.l1, required this.l2,
    required this.footer, required this.actions,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: AppCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Tag(type),
              const SizedBox(width: 8),
              const Icon(Icons.schedule, size: 14, color: C.meta),
              const SizedBox(width: 4),
              Expanded(child: Text(date, style: T.caption)),
              StatusBadge(status, kind),
            ]),
            gap12,
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              IconBox(icon, size: 36),
              const SizedBox(width: 10),
              Expanded(child: Text(title, style: T.title)),
            ]),
            gap12,
            Row(children: [
              Icon(targetIcon, size: 14, color: C.meta),
              const SizedBox(width: 6),
              Expanded(child: Text(target, style: T.caption)),
            ]),
            const SizedBox(height: 6),
            Text(l1, style: T.caption),
            Text(l2, style: T.caption),
            const Divider(height: 24, color: C.divider),
            Row(children: [
              Expanded(child: Text(footer, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: C.primary))),
              ActionIcons(actions),
            ]),
          ]),
        ),
      );
}
