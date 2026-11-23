import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:eduapp/providers/auth_provider.dart';
import 'package:eduapp/main.dart';
import 'package:eduapp/router/app_routes.dart';

void main() {
  testWidgets('registration and learner sign-in follow the app routes', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ProviderScope(child: EduApp()));
    await tester.pumpAndSettle();

    expect(find.text('Connexion'), findsOneWidget);

    await tester.tap(find.text('Créer un compte'));
    await tester.pumpAndSettle();
    expect(find.text('Inscription'), findsOneWidget);

    await tester.ensureVisible(find.text('Retour à la connexion'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Retour à la connexion'));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byType(TextField).at(0),
      'apprenant@example.com',
    );
    await tester.enterText(find.byType(TextField).at(1), 'password');
    await tester.tap(find.text('Se connecter'));
    await tester.pumpAndSettle();

    expect(find.text('Bonjour, Fatou'), findsOneWidget);
  });

  testWidgets('administrator sign-in opens the admin dashboard', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ProviderScope(child: EduApp()));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).at(0), 'admin@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'password');
    await tester.tap(find.byType(DropdownButtonFormField<UserRole>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Administrateur').last);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Se connecter'));
    await tester.pumpAndSettle();

    expect(find.text('Statistiques Performance'), findsOneWidget);

    GoRouter.of(tester.element(find.text('Statistiques Performance')))
        .go(AppRoutes.catalogue);
    await tester.pumpAndSettle();

    expect(find.text('Statistiques Performance'), findsOneWidget);
  });
}
