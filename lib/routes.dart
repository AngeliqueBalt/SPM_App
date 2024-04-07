import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:student_progress_monitor_app/models/class.dart';
import 'package:student_progress_monitor_app/models/user.dart';
import 'package:student_progress_monitor_app/providers/authentication_provider.dart';
import 'package:student_progress_monitor_app/providers/class_provider.dart';
import 'package:student_progress_monitor_app/screens/admin/admin_dashboard.dart';
import 'package:student_progress_monitor_app/screens/login_screen.dart';
import 'package:student_progress_monitor_app/screens/profile_screen.dart';
import 'package:student_progress_monitor_app/screens/student/submissions_screen.dart';
import 'package:student_progress_monitor_app/screens/student/quiz_summary_screen.dart';
import 'package:student_progress_monitor_app/screens/student/student_class_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/manage_quiz_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/new_quiz_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/teacher_all_quizzes_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/teacher_class_screen.dart';
import 'package:student_progress_monitor_app/screens/home_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/teacher_quiz_summary_screen.dart';

part 'routes.g.dart';

final GlobalKey<NavigatorState> _routerKey = GlobalKey<NavigatorState>();

GlobalKey<NavigatorState> get routerKey => _routerKey;

@riverpod
GoRouter router(final RouterRef ref) {
  final isAuthenticatedState = ref.watch(isAuthenticatedProvider);

  final currentUser = ref.watch(authenticationProvider).value;
  final isTeacher = [UserType.teacher].contains(currentUser?.user.userType);
  final isAdmin = [UserType.admin].contains(currentUser?.user.userType);

  return GoRouter(
    navigatorKey: _routerKey,
    routes: <RouteBase>[
      // Loading
      GoRoute(
        path: '/_loading',
        builder: (final BuildContext context, final GoRouterState state) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),

      // Login
      GoRoute(
        path: '/login',
        builder: (final BuildContext context, final GoRouterState state) {
          return const LogInScreen();
        },
      ),

      // Dashboard
      GoRoute(
        path: '/',
        builder: (final BuildContext context, final GoRouterState state) {
          if (isAdmin) {
            return const AdminDashboard();
          }

          return const HomeScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'profile',
            builder: (final BuildContext context, final GoRouterState state) {
              return const ProfileScreen();
            },
          ),
          GoRoute(
            path: 'class/:classId',
            builder: (final BuildContext context, final GoRouterState state) {
              final String classId = state.pathParameters['classId']!;
              if (isTeacher) {
                return TeacherClassScreen(classId: classId);
              } else {
                return StudentClassScreen(
                    clazz: ref
                        .read(classesProvider)
                        .requireValue
                        .where((final Class clazz) => clazz.id == classId)
                        .first);
              }
            },
            routes: [
              // Quiz Summary
              GoRoute(
                path: 'all-quizzes',
                builder:
                    (final BuildContext context, final GoRouterState state) {
                  final String classId = state.pathParameters['classId']!;
                  if (isTeacher) {
                    return TeacherAllQuizzesScreen(classId: classId);
                  } else {
                    return SubmissionsScreen(classId: classId);
                  }
                },
              ),

              GoRoute(
                path: 'quiz/:quizId',
                builder:
                    (final BuildContext context, final GoRouterState state) {
                  final quizId = state.pathParameters['quizId']!;
                  final classId = state.pathParameters['classId']!;

                  if (isTeacher) {
                    return TeacherQuizSummaryScreen(
                      quizId: quizId,
                      classId: classId,
                    );
                  } else {
                    return QuizSummaryScreen(
                      classId: classId,
                      quizId: quizId,
                    );
                  }
                },
              ),

              GoRoute(
                  path: 'manage-quizzes',
                  builder:
                      (final BuildContext context, final GoRouterState state) {
                    final String classId = state.pathParameters['classId']!;
                    return ManageQuizScreen(classId: classId);
                  },
                  routes: [
                    GoRoute(
                        path: 'new-quiz',
                        builder: (final BuildContext context,
                            final GoRouterState state) {
                          final String classId =
                              state.pathParameters['classId']!;
                          return NewQuizScreen(classId: classId);
                        })
                  ]),
            ],
          ),
        ],
      ),
    ],

    // Authentication
    redirect: (final context, final routerState) {
      if (isAuthenticatedState.isLoading) return '/_loading';

      final bool requiresAuth = routerState.fullPath! != '/login';
      final bool isAuthenticated = isAuthenticatedState.requireValue;

      if (isAuthenticated) {
        if (requiresAuth != isAuthenticated) return '/';
      } else {
        if (requiresAuth != isAuthenticated) return '/login';
      }

      return null;
    },
  );
}
