
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum UserRole {
  apprenant,
  administrateur,
}

class AuthState {
  final bool isAuthenticated;
  final UserRole? role;
  final String? email;

  const AuthState({
    this.isAuthenticated = false,
    this.role,
    this.email,
  });
}

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    return const AuthState();
  }

  void login(String email, UserRole role) {
    state = AuthState(
      isAuthenticated: true,
      role: role,
      email: email,
    );
  }

  void logout() {
    state = const AuthState();
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);
