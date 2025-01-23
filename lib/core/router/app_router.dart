import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Import your screens
import '../../features/auth/screens/login_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/auth/screens/webview_screen.dart';

class AppRouter {
  // Create a global navigator key
  static final GlobalKey<NavigatorState> _rootNavigatorKey = 
      GlobalKey<NavigatorState>();

  // Define the router configuration
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/login', // Set initial route
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/microsoft-login',
        builder: (context, state) => const WebViewContainer(),
      ),
    ],
  );
}