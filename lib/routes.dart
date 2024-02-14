import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:student_progress_monitor_app/data/mock/classes.dart';
import 'package:student_progress_monitor_app/data/mock/users.dart';
import 'package:student_progress_monitor_app/models/class.dart';
import 'package:student_progress_monitor_app/models/user.dart';
import 'package:student_progress_monitor_app/providers/authentication_provider.dart';
import 'package:student_progress_monitor_app/screens/admin/admin_dashboard.dart';
import 'package:student_progress_monitor_app/screens/login_screen.dart';
import 'package:student_progress_monitor_app/screens/student/all_quizzes_screen.dart';
import 'package:student_progress_monitor_app/screens/student/quiz_summary_screen.dart';
import 'package:student_progress_monitor_app/screens/student/student_class_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/manage_quiz_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/teacher_all_quizzes_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/teacher_class_screen.dart';
import 'package:student_progress_monitor_app/screens/home_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/teacher_quiz_summary_screen.dart';

part 'routes.g.dart';

final Class clazz = classes[0];
final List<User> teachers = [
  const User(
    id: '55ef528e-99bf-45f1-b0b3-5689c35bc7bf',
    name: "Ethan Anderson",
    email: "Ethan@school.com",
    idNumber: "SCH-T0001",
    userType: UserType.teacher,
  ),
];

@riverpod
GoRouter router(RouterRef ref) {
  final isAuthenticatedState = ref.watch(isAuthenticatedProvider);

  final currentUser = ref.watch(authenticationProvider).value;
  final isTeacher = [UserType.teacher].contains(currentUser?.user.userType);
  final isAdmin = [UserType.admin].contains(currentUser?.user.userType);

  return GoRouter(
    routes: <RouteBase>[
      // Loading
      GoRoute(
        path: '/_loading',
        builder: (BuildContext context, GoRouterState state) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),

      // Authentication
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LogInScreen();
        },
      ),

      // Admin dashboard
      GoRoute(
        path: '/admin',
        builder: (BuildContext context, GoRouterState state) {
          return AdminDashboard(teachers: teachers);
        },
        redirect: (BuildContext context, GoRouterState state) {
          if (!isAdmin) {
            return '/login';
          }
          return null;
        },
      ),

      // Dashboard
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return HomeScreen(classes: classes);
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'class/:classId',
            builder: (BuildContext context, GoRouterState state) {
              if (isTeacher) {
                return TeacherClassScreen(
                  name: state.pathParameters['classId']!,
                  clazz: clazz,
                );
              } else {
                return StudentClassScreen(
                    name: state.pathParameters['classId']!);
              }
            },
          ),
        ],
      ),

      // Quiz Summary
      GoRoute(
        path: '/all-quizzes',
        builder: (BuildContext context, GoRouterState state) {
          if (isTeacher) {
            return const TeacherAllQuizzesScreen();
          } else {
            return const AllQuizzesScreen();
          }
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'quiz/:quizId',
            builder: (BuildContext context, GoRouterState state) {
              if (isTeacher) {
                return TeacherQuizSummaryScreen(
                    name: state.pathParameters['quizId']!);
              } else {
                return QuizSummaryScreen(name: state.pathParameters['quizId']!);
              }
            },
          ),
        ],
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
      if (isAuthenticatedState.isLoading) return '/_loading';

      bool requiresAuth = routerState.fullPath! != '/login';
      bool isAuthenticated = isAuthenticatedState.requireValue;

      if (isAuthenticated || isTeacher && isAuthenticated) {
        if (requiresAuth != isAuthenticated) return '/';
      } else {
        if (requiresAuth != isAuthenticated) return '/login';
      }

      if (isAdmin && isAuthenticated) {
        if (requiresAuth == isAuthenticated) return '/admin';
      } else {
        if (requiresAuth != isAuthenticated) return '/login';
      }

      return null;
    },
  );
}
