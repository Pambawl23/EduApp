import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../router/app_routes.dart';
import '../theme/app_theme.dart';

/* ───────────────────────── Barre du haut ───────────────────────── */

class AdminBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? leading;
  final List<IconData> actions;
  final bool profile;
  const AdminBar(this.title,
      {this.leading = Icons.arrow_back, this.actions = const [], this.profile = true, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      automaticallyImplyLeading: false,
      leading: leading == null
          ? null
          : IconButton(
              icon: Icon(leading, size: 24),
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go(AppRoutes.adminDashboard);
                }
              },
            ),
      actions: [
        for (final a in actions) IconButton(icon: Icon(a, size: 24), onPressed: () {}),
        if (profile)
          Padding(
            padding: const EdgeInsets.only(right: 12, left: 4),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white.withOpacity(0.18),
              child: const Icon(Icons.person_outline, size: 18, color: Colors.white),
            ),
          )
        else
          const SizedBox(width: 8),
      ],
    );
  }
}

/* ───────────────────────── Barre d'onglets ───────────────────────── */

class AdminTabs extends StatelessWidget {
  final int current;
  final List<(IconData, String)> items;
  const AdminTabs({required this.current, required this.items, super.key});

  static const standard = <(IconData, String)>[
    (Icons.dashboard_outlined, 'Accueil'),
    (Icons.menu_book_outlined, 'Formations'),
    (Icons.assignment_outlined, 'Examens'),
    (Icons.notifications_outlined, 'Notifications'),
    (Icons.more_horiz, 'Plus'),
  ];
  static const stats = <(IconData, String)>[
    (Icons.dashboard_outlined, 'Accueil'),
    (Icons.school_outlined, 'Formations'),
    (Icons.assignment_outlined, 'Examens'),
    (Icons.query_stats, 'Statistiques'),
    (Icons.more_horiz, 'Plus'),
  ];
  static const users = <(IconData, String)>[
    (Icons.dashboard_outlined, 'Accueil'),
    (Icons.menu_book_outlined, 'Formations'),
    (Icons.group_outlined, 'Utilisateurs'),
    (Icons.verified_outlined, 'Examens'),
    (Icons.notifications_outlined, 'Notifications'),
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: C.borderLight)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            children: [
              for (var i = 0; i < items.length; i++)
                Expanded(
                  child: InkWell(
                    onTap: () {
                      final label = items[i].$2;

                      if (label == 'Plus') {
                        showModalBottomSheet(
                          context: context,
                          builder: (sheetContext) => SafeArea(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.play_lesson_outlined),
                                  title: const Text('Gestion des cours'),
                                  onTap: () {
                                    Navigator.pop(sheetContext);
                                    context.go(AppRoutes.adminCourses);
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.category_outlined),
                                  title: const Text('Gestion des catégories'),
                                  onTap: () {
                                    Navigator.pop(sheetContext);
                                    context.go(AppRoutes.adminCategories);
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.query_stats),
                                  title: const Text('Statistiques'),
                                  onTap: () {
                                    Navigator.pop(sheetContext);
                                    context.go(AppRoutes.adminStatistics);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                        return;
                      }

                      final routes = {
                        'Accueil': AppRoutes.adminDashboard,
                        'Formations': AppRoutes.adminFormations,
                        'Utilisateurs': AppRoutes.adminUsers,
                        'Examens': AppRoutes.adminExams,
                        'Notifications': AppRoutes.adminNotifications,
                        'Statistiques': AppRoutes.adminStatistics,
                      };

                      final route = routes[label];

                      if (route != null && i != current) {
                        context.go(route);
                      }
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          items[i].$1,
                          size: 24,
                          color: i == current ? C.primary : C.meta,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          items[i].$2,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: i == current
                                ? FontWeight.w800
                                : FontWeight.w600,
                            color: i == current ? C.primary : C.meta,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

}

/* ───────────────────────── Page standard ───────────────────────── */

class AdminPage extends StatelessWidget {
  final PreferredSizeWidget bar;
  final List<Widget> children;
  final Widget? tabs;
  final EdgeInsets padding;
  final Widget? bottom; // zone d'actions fixée en bas
  const AdminPage({
    required this.bar,
    required this.children,
    this.tabs,
    this.bottom,
    this.padding = const EdgeInsets.fromLTRB(16, 16, 16, 24),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bar,
      bottomNavigationBar: tabs,
      body: Column(
        children: [
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(overscroll: false),
              child: ListView(
                physics: const ClampingScrollPhysics(),
                // padding bas réduit si un `bottom` fixe existe (évite le double espace)
                padding: EdgeInsets.only(
                  left: padding.left,
                  right: padding.right,
                  top: padding.top,
                  bottom: bottom != null ? 12 : padding.bottom,
                ),
                children: children,
              ),
            ),
          ),
          if (bottom != null)
            Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: C.borderLight)),
              ),
              // Si les onglets existent, ils gèrent déjà le SafeArea bas → pas de double inset.
              child: tabs == null ? SafeArea(top: false, child: bottom!) : bottom!,
            ),
        ],
      ),
    );
  }
}

/* ───────────────────────── Cartes & textes ───────────────────────── */

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Color color;
  final Color borderColor;
  final double radius;
  const AppCard({
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.color = Colors.white,
    this.borderColor = C.border,
    this.radius = 12,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: borderColor),
        boxShadow: const [
          BoxShadow(color: Color(0x0A0F172A), blurRadius: 4, offset: Offset(0, 2)),
          BoxShadow(color: Color(0x080F172A), blurRadius: 12, offset: Offset(0, 4)),
        ],
      ),
      child: child,
    );
  }
}

class Eyebrow extends StatelessWidget {
  final String text;
  final Color? color;
  const Eyebrow(this.text, {this.color, super.key});
  @override
  Widget build(BuildContext context) =>
      Text(text.toUpperCase(), style: T.eyebrow.copyWith(color: color));
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String? action;
  const SectionTitle(this.title, {this.action, super.key});
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 12),
        child: Row(
          children: [
            Expanded(child: Text(title, style: T.h3)),
            if (action != null)
              Text(action!, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: C.primary)),
          ],
        ),
      );
}

const gap8 = SizedBox(height: 8);
const gap12 = SizedBox(height: 12);
const gap16 = SizedBox(height: 16);
const gap24 = SizedBox(height: 24);

/* ───────────────────────── Badges ───────────────────────── */

enum Kind { draft, published, archived, scheduled, sent, danger, neutral }

class StatusBadge extends StatelessWidget {
  final String label;
  final Kind kind;
  final IconData? icon;
  const StatusBadge(this.label, this.kind, {this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    late Color bg, fg, bd;
    switch (kind) {
      case Kind.draft:
      case Kind.neutral:
        bg = C.divider; fg = C.meta; bd = C.borderLight;
        break;
      case Kind.published:
      case Kind.sent:
        bg = C.successSoft; fg = C.success; bd = C.successBorder;
        break;
      case Kind.archived:
        bg = C.warningSoft; fg = C.warning; bd = C.warningBorder;
        break;
      case Kind.scheduled:
        bg = C.infoSoft; fg = C.info; bd = C.infoBorder;
        break;
      case Kind.danger:
        bg = C.dangerSoft; fg = C.dangerDark; bd = const Color(0xFFFECACA);
        break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        border: Border.all(color: bd),
        borderRadius: BorderRadius.circular(9999),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        if (icon != null) ...[Icon(icon, size: 12, color: fg), const SizedBox(width: 4)],
        Text(label.toUpperCase(),
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: fg, letterSpacing: 0.3)),
      ]),
    );
  }
}

class Tag extends StatelessWidget {
  final String label;
  final Color bg;
  final Color fg;
  const Tag(this.label, {this.bg = C.primarySoft, this.fg = C.primary, super.key});
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(6)),
        child: Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: fg)),
      );
}

/* ───────────────────────── Avatars & icônes ───────────────────────── */

class Avatar extends StatelessWidget {
  final String initials;
  final double size;
  final Color bg;
  const Avatar(this.initials, {this.size = 40, this.bg = C.primary, super.key});
  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
        child: Text(initials,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: size * 0.34)),
      );
}

class IconBox extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color bg;
  final Color fg;
  const IconBox(this.icon, {this.size = 40, this.bg = C.primarySoft, this.fg = C.primary, super.key});
  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
        child: Icon(icon, size: size * 0.5, color: fg),
      );
}

/* ───────────────────────── Champs ───────────────────────── */

class Field extends StatelessWidget {
  final String label;
  final String? value;
  final String? hint;
  final IconData? prefix;
  final Widget? suffix;
  final String? error;
  final String? helper;
  final String? counter;
  final int lines;
  final bool required;
  const Field(
    this.label, {
    this.value,
    this.hint,
    this.prefix,
    this.suffix,
    this.error,
    this.helper,
    this.counter,
    this.lines = 1,
    this.required = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final hasError = error != null;
    final text = value ?? hint ?? '';
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Expanded(
            child: Text.rich(TextSpan(children: [
              TextSpan(text: label.toUpperCase(), style: T.eyebrow.copyWith(color: C.body)),
              if (required) const TextSpan(text: ' *', style: TextStyle(color: C.danger, fontWeight: FontWeight.w700)),
            ])),
          ),
          if (counter != null) Text(counter!, style: T.caption),
        ]),
        const SizedBox(height: 8),
        Container(
          constraints: BoxConstraints(minHeight: lines == 1 ? 52 : 52.0 + (lines - 1) * 20),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: lines == 1 ? 0 : 14),
          alignment: lines == 1 ? Alignment.centerLeft : Alignment.topLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: hasError ? C.danger : C.border, width: hasError ? 2 : 1),
          ),
          child: Row(crossAxisAlignment: lines == 1 ? CrossAxisAlignment.center : CrossAxisAlignment.start, children: [
            if (prefix != null) ...[Icon(prefix, size: 20, color: C.hint), const SizedBox(width: 10)],
            Expanded(
              child: Text(text,
                  style: TextStyle(
                      fontSize: 14,
                      height: 1.45,
                      color: value == null ? C.hint : C.heading)),
            ),
            if (suffix != null) suffix!,
          ]),
        ),
        if (hasError) ...[
          const SizedBox(height: 6),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Icon(Icons.error_outline, size: 14, color: C.danger),
            const SizedBox(width: 4),
            Expanded(child: Text(error!, style: const TextStyle(fontSize: 12, color: C.danger))),
          ]),
        ],
        if (helper != null) ...[
          const SizedBox(height: 6),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Icon(Icons.info_outline, size: 14, color: C.meta),
            const SizedBox(width: 4),
            Expanded(child: Text(helper!, style: T.caption)),
          ]),
        ],
      ]),
    );
  }
}

class SearchBox extends StatelessWidget {
  final String hint;
  final IconData? trailing;
  const SearchBox(this.hint, {this.trailing = Icons.tune, super.key});
  @override
  Widget build(BuildContext context) => Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: C.border),
        ),
        child: Row(children: [
          const Icon(Icons.search, size: 20, color: C.hint),
          const SizedBox(width: 10),
          Expanded(child: Text(hint, style: const TextStyle(fontSize: 14, color: C.hint), overflow: TextOverflow.ellipsis)),
          if (trailing != null) Icon(trailing, size: 20, color: C.meta),
        ]),
      );
}

class FilterRow extends StatelessWidget {
  final List<String> labels;
  final int selected;
  const FilterRow(this.labels, {this.selected = 0, super.key});
  @override
  Widget build(BuildContext context) => SizedBox(
        height: 38,
        child: ListView.separated(
          scrollDirection: Axis.horizontal, // ✅ scroll horizontal : OK dans un scroll vertical
          itemCount: labels.length,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (_, i) {
            final on = i == selected;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: on ? C.primary : Colors.white,
                borderRadius: BorderRadius.circular(9999),
                border: Border.all(color: on ? C.primary : C.border),
              ),
              child: Text(labels[i],
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: on ? Colors.white : C.body)),
            );
          },
        ),
      );
}

/* ───────────────────────── Boutons ───────────────────────── */

enum BtnKind { primary, secondary, danger, text }

class AppButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final BtnKind kind;
  final VoidCallback? onPressed;
  const AppButton(this.label, {this.icon, this.kind = BtnKind.primary, this.onPressed, super.key});
  const AppButton.secondary(this.label, {this.icon, this.onPressed, super.key}) : kind = BtnKind.secondary;
  const AppButton.danger(this.label, {this.icon, this.onPressed, super.key}) : kind = BtnKind.danger;
  const AppButton.text(this.label, {this.icon, this.onPressed, super.key}) : kind = BtnKind.text;

  @override
  Widget build(BuildContext context) {
    Color bg = C.primary, fg = Colors.white;
    BorderSide side = BorderSide.none;
    switch (kind) {
      case BtnKind.secondary:
        bg = Colors.white; fg = C.primary; side = const BorderSide(color: C.primary, width: 2);
        break;
      case BtnKind.danger:
        bg = C.danger; fg = Colors.white;
        break;
      case BtnKind.text:
        bg = Colors.transparent; fg = C.primary;
        break;
      case BtnKind.primary:
        break;
    }
    return SizedBox(
      width: double.infinity,
      height: kind == BtnKind.text ? 44 : 56,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: side),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (icon != null) ...[Icon(icon, size: 20), const SizedBox(width: 8)],
          Flexible(child: Text(label, style: T.button.copyWith(fontSize: 15, color: fg), overflow: TextOverflow.ellipsis)),
        ]),
      ),
    );
  }
}

/// Bouton flottant pleine largeur (« Créer une formation », etc.)
class WideAction extends StatelessWidget {
  final String label;
  final IconData icon;
  const WideAction(this.label, this.icon, {super.key});
  @override
  Widget build(BuildContext context) => AppButton(label, icon: icon);
}

/* ───────────────────────── Divers ───────────────────────── */

class InfoBanner extends StatelessWidget {
  final String text;
  final IconData icon;
  final Kind kind;
  final String? title;
  const InfoBanner(this.text, {this.icon = Icons.info_outline, this.kind = Kind.scheduled, this.title, super.key});
  @override
  Widget build(BuildContext context) {
    late Color bg, fg, bd;
    switch (kind) {
      case Kind.published:
      case Kind.sent:
        bg = C.successSoft; fg = C.success; bd = C.successBorder; break;
      case Kind.archived:
        bg = C.warningSoft; fg = C.warning; bd = C.warningBorder; break;
      case Kind.danger:
        bg = C.dangerSoft; fg = C.dangerDark; bd = const Color(0xFFFECACA); break;
      default:
        bg = C.infoSoft; fg = C.info; bd = C.infoBorder;
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: bg, border: Border.all(color: bd), borderRadius: BorderRadius.circular(12)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, size: 20, color: fg),
        const SizedBox(width: 10),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            if (title != null) Text(title!, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: fg)),
            Text(text, style: TextStyle(fontSize: 13, color: fg, height: 1.4)),
          ]),
        ),
      ]),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final double value;
  final Color color;
  final double height;
  const ProgressBar(this.value, {this.color = C.primary, this.height = 6, super.key});
  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(9999),
        child: LinearProgressIndicator(
          value: value,
          minHeight: height,
          backgroundColor: C.borderLight,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      );
}

class CounterStepper extends StatelessWidget {
  final String value;
  const CounterStepper(this.value, {super.key});
  @override
  Widget build(BuildContext context) => Container(
        height: 52,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: C.border),
        ),
        child: Row(children: [
          const Padding(padding: EdgeInsets.symmetric(horizontal: 14), child: Icon(Icons.remove, size: 20, color: C.meta)),
          Expanded(child: Center(child: Text(value, style: T.h3))),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 14), child: Icon(Icons.add, size: 20, color: C.primary)),
        ]),
      );
}

/// Ligne « choix » (radio/check) sélectionnable : formats, rôles, niveaux…
class ChoiceCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final bool selected;
  final Widget? trailing;
  const ChoiceCard(this.title, {this.subtitle, this.icon, this.selected = false, this.trailing, super.key});
  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: selected ? C.primarySoft : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: selected ? C.primary : C.border, width: selected ? 2 : 1),
        ),
        child: Row(children: [
          if (icon != null) ...[IconBox(icon!, bg: selected ? Colors.white : C.divider), const SizedBox(width: 12)],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: T.title),
                if (subtitle != null) ...[const SizedBox(height: 2), Text(subtitle!, style: T.caption)],
              ],
            ),
          ),
          const SizedBox(width: 8),
          trailing ??
              Icon(selected ? Icons.check_circle : Icons.radio_button_unchecked,
                  size: 22, color: selected ? C.primary : C.hint),
        ]),
      );
}

class StatTile extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final String? delta;
  const StatTile(this.icon, this.value, this.label, {this.delta, super.key});
  @override
  Widget build(BuildContext context) => AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(children: [
              IconBox(icon, size: 34),
              const Spacer(),
              if (delta != null)
                Text(delta!, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: C.success)),
            ]),
            const SizedBox(height: 10),
            Text(value, style: T.h2),
            Text(label, style: T.caption),
          ],
        ),
      );
}

/// Ligne de liste d'administration (icône/avatar, titre, sous-titre, accessoire).
class AdminRow extends StatelessWidget {
  final Widget leading;
  final String title;
  final String subtitle;
  final Widget? trailing;
  const AdminRow({required this.leading, required this.title, required this.subtitle, this.trailing, super.key});
  @override
  Widget build(BuildContext context) => Container(
        constraints: const BoxConstraints(minHeight: 64),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: C.divider)),
        ),
        child: Row(children: [
          leading,
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: T.title, overflow: TextOverflow.ellipsis),
                Text(subtitle, style: T.caption, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ]),
      );
}

/// Rangée d'icônes d'action (voir / modifier / supprimer…).
class ActionIcons extends StatelessWidget {
  final List<IconData> icons;
  final Color? lastColor;
  final List<String?> routes;
  const ActionIcons(this.icons,
      {this.lastColor, this.routes = const [], super.key});

  Widget _button(BuildContext context, int index) {
    final route = index < routes.length ? routes[index] : null;
    return IconButton(
      onPressed: route == null ? null : () => context.push(route),
      padding: const EdgeInsets.all(6),
      constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
      visualDensity: VisualDensity.compact,
      icon: Icon(
        icons[index],
        size: 20,
        color: index == icons.length - 1 && lastColor != null
            ? lastColor
            : C.meta,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < icons.length; i++) _button(context, i),
        ],
      );
}

/* ───────────────────────── Écran de confirmation (modale) ───────────────────────── */

/// Fond assombri + boîte centrée, pour tous les écrans « Supprimer… ».
class DialogPage extends StatelessWidget {
  final PreferredSizeWidget bar;
  final Widget child;
  const DialogPage({required this.bar, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bar,
      body: Stack(
        children: [
          // Fond (contenu factice derrière la modale)
          Positioned.fill(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                for (var i = 0; i < 6; i++)
                  Container(
                    height: 72,
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
              ],
            ),
          ),

          // Overlay sombre
          Positioned.fill(
            child: Container(color: const Color(0xFF0F172A).withOpacity(0.55)),
          ),

          // ✅ Modale centrée SANS Positioned.fill :
          // le Center garde la hauteur du Stack, mais son enfant est intrinsèque.
          // Le ConstrainedBox(maxHeight) borne le scroll → pas d'étirement.
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420, maxHeight: 640),
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  clipBehavior: Clip.antiAlias,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WarningHeader extends StatelessWidget {
  final String title;
  final Widget message;
  const WarningHeader(this.title, this.message, {super.key});
  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(color: C.dangerSoft, shape: BoxShape.circle),
            child: const Icon(Icons.warning_amber_rounded, size: 32, color: C.danger),
          ),
          const SizedBox(height: 16),
          Text(title, textAlign: TextAlign.center, style: T.h2),
          const SizedBox(height: 8),
          DefaultTextStyle(
            style: const TextStyle(fontSize: 14, color: C.meta, height: 1.45),
            textAlign: TextAlign.center,
            child: message,
          ),
          const SizedBox(height: 16),
        ],
      );
}

/// Petit tableau « libellé — valeur » dans une boîte teintée.
class FactBox extends StatelessWidget {
  final List<(IconData, String, String, Color?)> rows;
  const FactBox(this.rows, {super.key});
  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: C.primarySoft, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < rows.length; i++) ...[
              if (i > 0) const Divider(height: 20, color: C.borderLight),
              Row(children: [
                Icon(rows[i].$1, size: 18, color: C.meta),
                const SizedBox(width: 8),
                Text(rows[i].$2, style: T.caption),
                const Spacer(),
                Flexible(
                  child: Text(rows[i].$3,
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: rows[i].$4 ?? C.heading)),
                ),
              ]),
            ],
          ],
        ),
      );
}