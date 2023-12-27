import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_progress_monitor_app/Screens/Teacher/Teacher_Home_Screen.dart';
import 'package:student_progress_monitor_app/screens/login_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/teacher_class_screen.dart';

// TODO: link with Riverpod provider to know when the user is authenticated
const bool isAuthenticated = true;

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    // Authentication
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LogInScreen();
      },
    ),

    // Dashboard
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const TeacherHomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'class/:classId',
          builder: (BuildContext context, GoRouterState state) {
            print(state.pathParameters['classId']);
            return TeacherClassScreen(name: state.pathParameters['classId']!);
          },
        ),
      ],
    ),
  ],
  redirect: (context, routerState) {
    bool requiresAuth = routerState.fullPath! != '/login';

    if (isAuthenticated) {
      if (requiresAuth != isAuthenticated) return '/';
    } else {
      if (requiresAuth != isAuthenticated) return '/login';
    }
  },
);
