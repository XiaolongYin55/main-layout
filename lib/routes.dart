
import 'package:flutter/material.dart';
import 'package:ui_assgn01/authentication/login.dart';
import 'package:ui_assgn01/pages/main_layout.dart';

//set on nav tapped routes
final Map<String, WidgetBuilder> appRoutes = {
  '/home': (context) => const MainLayout(initialIndex: 0),
  '/payment': (context) => const MainLayout(initialIndex: 1),
  '/combs': (context) => const MainLayout(initialIndex: 2),
  '/profile': (context) => const MainLayout(initialIndex: 3),
  '/login': (context) => const LoginPage(),
};

