import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_progress_monitor_app/data/classes.dart';
import 'package:student_progress_monitor_app/data/users.dart';
import 'package:student_progress_monitor_app/models/class_model.dart';
import 'package:student_progress_monitor_app/models/user_model.dart';
import 'package:student_progress_monitor_app/screens/login_screen.dart';
import 'package:student_progress_monitor_app/screens/student/all_quizzes_screen.dart';
import 'package:student_progress_monitor_app/screens/student/quiz_summary_screen.dart';
import 'package:student_progress_monitor_app/screens/student/student_class_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/manage_quiz_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/teacher_all_quizzes_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/teacher_class_screen.dart';
import 'package:student_progress_monitor_app/screens/home_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/teacher_quiz_summary_screen.dart';

// TODO: make authentication work
// TODO: make isTeacher work

bool isAuthenticated = true;
bool isTeacher = true;

final UserModel user = users[0];
final ClassModel clazz = classes[0];

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
        return HomeScreen(user: user, classes: classes);
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
              return StudentClassScreen(name: state.pathParameters['classId']!);
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

    // Previous Quizzes
    GoRoute(
      path: '/all-quizzes',
      builder: (BuildContext context, GoRouterState state) {
        if (isTeacher) {
          return const TeacherAllQuizzesScreen();
        } else {
          return const AllQuizzesScreen();
        }
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
