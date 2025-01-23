import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Import the screens you'll be using
import 'features/auth/screens/login_screen.dart';
import 'features/home/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // Create the router configuration
  final _router = GoRouter(
    initialLocation: '/login', // Set the initial route
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    // Use MaterialApp.router instead of MaterialApp
    return MaterialApp.router(
      title: 'My Flutter App',
      theme: ThemeData(
        // Keep your existing color scheme
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFFD62F33),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      // Use routerConfig instead of home
      routerConfig: _router,
    );
  }
}