import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/pages/login_selector_page.dart';
import '../../features/auth/presentation/pages/simple_login_page.dart';
import '../../features/auth/presentation/pages/modern_login_page.dart';
import '../../features/auth/presentation/pages/professional_login_page.dart';
import '../../features/countries/presentation/pages/countries_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/login-selector',
    routes: [
      GoRoute(
        path: '/login-selector',
        name: 'login-selector',
        builder: (context, state) => const LoginSelectorPage(),
      ),
      GoRoute(
        path: '/login/simple',
        name: 'simple-login',
        builder: (context, state) => const SimpleLoginPage(),
      ),
      GoRoute(
        path: '/login/modern',
        name: 'modern-login',
        builder: (context, state) => const ModernLoginPage(),
      ),
      GoRoute(
        path: '/login/professional',
        name: 'professional-login',
        builder: (context, state) => const ProfessionalLoginPage(),
      ),
      GoRoute(
        path: '/countries',
        name: 'countries',
        builder: (context, state) => const CountriesPage(),
      ),
    ],
  );
}