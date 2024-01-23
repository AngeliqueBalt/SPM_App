import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_progress_monitor_app/screens/login_screen.dart';
import 'package:student_progress_monitor_app/screens/student/all_quizzes_screen.dart';
import 'package:student_progress_monitor_app/screens/student/quiz/quiz_screen.dart';
import 'package:student_progress_monitor_app/screens/student/student_class_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/manage_quiz_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/teacher_class_screen.dart';
import 'package:student_progress_monitor_app/screens/home_screen.dart';

// TODO: link with Riverpod provider to know when the user is authenticated
bool isAuthenticated = true;

const bool isTeacher = true;

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
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'class/:classId',
          builder: (BuildContext context, GoRouterState state) {
            print(state.pathParameters['classId']);
            if (isTeacher) {
              return TeacherClassScreen(name: state.pathParameters['classId']!);
            } else {
              return StudentClassScreen(name: state.pathParameters['classId']!);
            }
          },
        ),
      ],
    ),

    // Previous Quizzes
    GoRoute(
      path: '/all-quizzes',
      builder: (BuildContext context, GoRouterState state) {
        return const AllQuizzesScreen();
      },
    ),

    GoRoute(
      path: '/manage-quizzes',
      builder: (BuildContext context, GoRouterState state) {
        return const ManageQuizScreen();
      },
    ),
  ],

  // Authentication
  redirect: (context, routerState) {
    bool requiresAuth = routerState.fullPath! != '/login';

    if (isAuthenticated) {
      if (requiresAuth != isAuthenticated) return '/';
    } else {
      if (requiresAuth != isAuthenticated) return '/login';
    }
  },
);
