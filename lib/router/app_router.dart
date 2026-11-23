import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/auth_provider.dart';
import 'app_routes.dart';
import '../screens/accueil.dart';
import '../screens/activites_a_realiser.dart';
import '../screens/apercu_de_l_examen.dart';
import '../screens/apercu_du_cours.dart';
import '../screens/catalogue.dart';
import '../screens/confirmation_d_envoi.dart';
import '../screens/creer_un_cours.dart';
import '../screens/creer_un_examen_tape_1.dart';
import '../screens/creer_un_examen_tape_2_questions.dart';
import '../screens/creer_une_cat_gorie.dart';
import '../screens/creer_une_formation.dart';
import '../screens/creer_une_notification.dart';
import '../screens/deconnexion.dart';
import '../screens/detail_de_la_notification.dart';
import '../screens/details_de_formation.dart';
import '../screens/export_r_ussi_rapport_pr_t.dart';
import '../screens/exporter_les_statistiques.dart';
import '../screens/filtre_de_p_riode.dart';
import '../screens/gestion_des_cat_gories.dart';
import '../screens/gestion_des_cours.dart';
import '../screens/gestion_des_examens.dart';
import '../screens/gestion_des_formations.dart';
import '../screens/gestion_des_utilisateurs.dart';
import '../screens/historique_des_notifications.dart';
import '../screens/inscription_formation.dart';
import '../screens/lire_cours.dart';
import '../screens/modifier_l_examen.dart';
import '../screens/modifier_la_question.dart';
import '../screens/modifier_l_utilisateur.dart';
import '../screens/modifier_la_cat_gorie.dart';
import '../screens/modifier_la_formation.dart';
import '../screens/modifier_le_cours.dart';
import '../screens/mot_de_passe_oublie.dart';
import '../screens/notifications.dart';
import '../screens/nouvel_utilisateur.dart';
import '../screens/page_connexion.dart';
import '../screens/page_inscription.dart';
import '../screens/passer_examen.dart';
import '../screens/profil.dart';
import '../screens/programmer_un_envoi.dart';
import '../screens/progression.dart';
import '../screens/recherche_filtre.dart';
import '../screens/resultats.dart';
import '../screens/statistiques.dart';
import '../screens/statistiques_performance.dart';
import '../screens/statut_de_la_formation.dart';
import '../screens/supprimer_l_utilisateur.dart';
import '../screens/supprimer_la_cat_gorie.dart';
import '../screens/supprimer_la_formation.dart';
import '../screens/supprimer_le_cours.dart';
import '../screens/tableau_de_bord.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  late final GoRouter router;
  router = GoRouter(
    initialLocation: AppRoutes.login,
    routes: [
      GoRoute(path: '/', redirect: (context, state) => AppRoutes.login),
      GoRoute(
        path: '/admin',
        redirect: (context, state) => AppRoutes.adminDashboard,
      ),
      GoRoute(
        path: AppRoutes.welcome,
        name: 'welcome',
        builder: (context, state) => const Accueil(),
      ),
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => const PageConnexion(),
      ),
      GoRoute(
        path: AppRoutes.register,
        name: 'register',
        builder: (context, state) => const PageInscription(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        name: 'forgotPassword',
        builder: (context, state) => const MotDePasseOublie(),
      ),
      ..._learnerRoutes,
      ..._adminRoutes,
    ],
    redirect: (context, state) {
      final auth = ref.read(authProvider);
      final path = state.matchedLocation;
      final isPublic = {
        AppRoutes.welcome,
        AppRoutes.login,
        AppRoutes.register,
        AppRoutes.forgotPassword,
      }.contains(path);

      if (!auth.isAuthenticated) {
        if (isPublic) return null;
        return Uri(
          path: AppRoutes.login,
          queryParameters: {'from': state.uri.toString()},
        ).toString();
      }

      if (isPublic) {
        final requested = state.uri.queryParameters['from'];
        if (requested != null &&
            requested.startsWith('/') &&
            !requested.startsWith('//') &&
            _isAllowedForRole(requested, auth.role)) {
          return requested;
        }
        return _homeForRole(auth.role);
      }

      if (path.startsWith('/admin') && auth.role != UserRole.administrateur) {
        return AppRoutes.learnerDashboard;
      }
      if (_isLearnerRoute(path) && auth.role == UserRole.administrateur) {
        return AppRoutes.adminDashboard;
      }
      return null;
    },
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page introuvable : ${state.uri}'))),
  );
  ref.listen(authProvider, (_, _) => router.refresh());
  ref.onDispose(router.dispose);
  return router;
});

String _homeForRole(UserRole? role) => role == UserRole.administrateur
    ? AppRoutes.adminDashboard
    : AppRoutes.learnerDashboard;

bool _isAllowedForRole(String location, UserRole? role) {
  final path = Uri.tryParse(location)?.path ?? location;
  if (path.startsWith('/admin')) {
    return role == UserRole.administrateur;
  }
  return !_isLearnerRoute(path) || role != UserRole.administrateur;
}

bool _isLearnerRoute(String path) =>
    path == AppRoutes.learnerDashboard ||
    path == AppRoutes.catalogue ||
    path.startsWith('/formations/') ||
    path.startsWith('/cours/') ||
    path.startsWith('/examens/') ||
    path == AppRoutes.search ||
    path == AppRoutes.activities ||
    path == AppRoutes.results ||
    path == AppRoutes.progression ||
    path == AppRoutes.notifications ||
    path.startsWith('/notifications/') ||
    path == AppRoutes.profile;

final List<RouteBase> _learnerRoutes = [
  GoRoute(
    path: AppRoutes.learnerDashboard,
    name: 'learnerDashboard',
    builder: (context, state) => const TableauDeBord(),
  ),
  GoRoute(
    path: AppRoutes.catalogue,
    name: 'catalogue',
    builder: (context, state) => const Catalogue(),
  ),
  GoRoute(
    path: AppRoutes.search,
    name: 'search',
    builder: (context, state) => const RechercheFiltre(),
  ),
  GoRoute(
    path: AppRoutes.formationDetails,
    name: 'formationDetails',
    builder: (context, state) => const InscriptionFormation(),
  ),
  GoRoute(
    path: AppRoutes.formationRegistration,
    name: 'formationRegistration',
    builder: (context, state) => const InscriptionFormation(),
  ),
  GoRoute(
    path: AppRoutes.activities,
    name: 'activities',
    builder: (context, state) => const ActivitesARealiser(),
  ),
  GoRoute(
    path: AppRoutes.coursePreview,
    name: 'coursePreview',
    builder: (context, state) => const ApercuDuCours(),
  ),
  GoRoute(
    path: AppRoutes.readCourse,
    name: 'readCourse',
    builder: (context, state) => const LireCours(),
  ),
  GoRoute(
    path: AppRoutes.takeExam,
    name: 'takeExam',
    builder: (context, state) => const PasserExamen(),
  ),
  GoRoute(
    path: AppRoutes.results,
    name: 'results',
    builder: (context, state) => const Resultats(),
  ),
  GoRoute(
    path: AppRoutes.progression,
    name: 'progression',
    builder: (context, state) => const Progression(),
  ),
  GoRoute(
    path: AppRoutes.notifications,
    name: 'notifications',
    builder: (context, state) => const Notifications(),
  ),
  GoRoute(
    path: AppRoutes.notificationDetails,
    name: 'notificationDetails',
    builder: (context, state) => const DetailDeLaNotification(),
  ),
  GoRoute(
    path: AppRoutes.profile,
    name: 'profile',
    builder: (context, state) => const Profil(),
  ),
  GoRoute(
    path: AppRoutes.logout,
    name: 'logout',
    builder: (context, state) => const Deconnexion(),
  ),
];

final List<RouteBase> _adminRoutes = [
  GoRoute(
    path: AppRoutes.adminDashboard,
    name: 'adminDashboard',
    builder: (context, state) => const StatistiquesPerformance(),
  ),
  GoRoute(
    path: AppRoutes.adminCourses,
    name: 'adminCourses',
    builder: (context, state) => const GestionDesCours(),
  ),
  GoRoute(
    path: AppRoutes.createCourse,
    name: 'createCourse',
    builder: (context, state) => const CreerUnCours(),
  ),
  GoRoute(
    path: AppRoutes.adminCoursePreview,
    name: 'adminCoursePreview',
    builder: (context, state) => const ApercuDuCours(),
  ),
  GoRoute(
    path: AppRoutes.editCourse,
    name: 'editCourse',
    builder: (context, state) => const ModifierLeCours(),
  ),
  GoRoute(
    path: AppRoutes.deleteCourse,
    name: 'deleteCourse',
    builder: (context, state) => const SupprimerLeCours(),
  ),
  GoRoute(
    path: AppRoutes.adminCategories,
    name: 'adminCategories',
    builder: (context, state) => const GestionDesCategories(),
  ),
  GoRoute(
    path: AppRoutes.createCategory,
    name: 'createCategory',
    builder: (context, state) => const CreerUneCategorie(),
  ),
  GoRoute(
    path: AppRoutes.editCategory,
    name: 'editCategory',
    builder: (context, state) => const ModifierLaCategorie(),
  ),
  GoRoute(
    path: AppRoutes.deleteCategory,
    name: 'deleteCategory',
    builder: (context, state) => const SupprimerLaCategorie(),
  ),
  GoRoute(
    path: AppRoutes.adminFormations,
    name: 'adminFormations',
    builder: (context, state) => const GestionDesFormations(),
  ),
  GoRoute(
    path: AppRoutes.adminFormationDetails,
    name: 'adminFormationDetails',
    builder: (context, state) => const DetailsDeFormation(),
  ),
  GoRoute(
    path: AppRoutes.createFormation,
    name: 'createFormation',
    builder: (context, state) => const CreerUneFormation(),
  ),
  GoRoute(
    path: AppRoutes.editFormation,
    name: 'editFormation',
    builder: (context, state) => const ModifierLaFormation(),
  ),
  GoRoute(
    path: AppRoutes.deleteFormation,
    name: 'deleteFormation',
    builder: (context, state) => const SupprimerLaFormation(),
  ),
  GoRoute(
    path: AppRoutes.formationStatus,
    name: 'formationStatus',
    builder: (context, state) => const StatutDeLaFormation(),
  ),
  GoRoute(
    path: AppRoutes.adminUsers,
    name: 'adminUsers',
    builder: (context, state) => const GestionDesUtilisateurs(),
  ),
  GoRoute(
    path: AppRoutes.createUser,
    name: 'createUser',
    builder: (context, state) => const NouvelUtilisateur(),
  ),
  GoRoute(
    path: AppRoutes.editUser,
    name: 'editUser',
    builder: (context, state) => const ModifierLUtilisateur(),
  ),
  GoRoute(
    path: AppRoutes.deleteUser,
    name: 'deleteUser',
    builder: (context, state) => const SupprimerLUtilisateur(),
  ),
  GoRoute(
    path: AppRoutes.adminExams,
    name: 'adminExams',
    builder: (context, state) => const GestionDesExamens(),
  ),
  GoRoute(
    path: AppRoutes.createExam,
    name: 'createExam',
    builder: (context, state) => const CreerUnExamenEtape1(),
  ),
  GoRoute(
    path: AppRoutes.createExamQuestions,
    name: 'createExamQuestions',
    builder: (context, state) => const CreerUnExamenEtape2(),
  ),
  GoRoute(
    path: AppRoutes.editExam,
    name: 'editExam',
    builder: (context, state) => const ModifierLExamen(),
  ),
  GoRoute(
    path: AppRoutes.editQuestion,
    name: 'editQuestion',
    builder: (context, state) => const ModifierLaQuestion(),
  ),
  GoRoute(
    path: AppRoutes.examPreview,
    name: 'examPreview',
    builder: (context, state) => const ApercuDeLExamen(),
  ),
  GoRoute(
    path: AppRoutes.adminNotifications,
    name: 'adminNotifications',
    builder: (context, state) => const HistoriqueDesNotifications(),
  ),
  GoRoute(
    path: AppRoutes.adminNotificationDetails,
    name: 'adminNotificationDetails',
    builder: (context, state) => const DetailDeLaNotification(),
  ),
  GoRoute(
    path: AppRoutes.createNotification,
    name: 'createNotification',
    builder: (context, state) => const CreerUneNotification(),
  ),
  GoRoute(
    path: AppRoutes.scheduleNotification,
    name: 'scheduleNotification',
    builder: (context, state) => const ProgrammerUnEnvoi(),
  ),
  GoRoute(
    path: AppRoutes.notificationConfirmation,
    name: 'notificationConfirmation',
    builder: (context, state) => const ConfirmationDEnvoi(),
  ),
  GoRoute(
    path: AppRoutes.adminStatistics,
    name: 'adminStatistics',
    builder: (context, state) => const Statistiques(),
  ),
  GoRoute(
    path: AppRoutes.statisticsPeriod,
    name: 'statisticsPeriod',
    builder: (context, state) => const FiltreDePeriode(),
  ),
  GoRoute(
    path: AppRoutes.exportStatistics,
    name: 'exportStatistics',
    builder: (context, state) => const ExporterLesStatistiques(),
  ),
  GoRoute(
    path: AppRoutes.reportReady,
    name: 'reportReady',
    builder: (context, state) => const ExportReussiRapportPret(),
  ),
  GoRoute(
    path: AppRoutes.statisticsPerformance,
    name: 'statisticsPerformance',
    builder: (context, state) => const StatistiquesPerformance(),
  ),
];
