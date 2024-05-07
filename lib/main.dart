import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:student_progress_monitor_app/data/network/class_management.dart';
import 'package:student_progress_monitor_app/data/network/classes.dart';
import 'package:student_progress_monitor_app/data/network/quizzes.dart';
import 'package:student_progress_monitor_app/data/network/reports.dart';
import 'package:student_progress_monitor_app/data/network/submissions.dart';
import 'package:student_progress_monitor_app/data/network/user_management.dart';
import 'package:student_progress_monitor_app/data/network/authentication.dart';
import 'package:student_progress_monitor_app/data/network/network.dart';
import 'package:student_progress_monitor_app/data/network/users.dart';
import 'package:student_progress_monitor_app/routes.dart';

// -----------------------------------------------------------------------------

final defaultBaseUrl = Uri.parse('http://angeliques-air:51548/');

final apiServices = List<ChopperService>.unmodifiable([
  AuthenticationService.create(),
  UsersService.create(),
  UserManagementService.create(),
  ClassManagementService.create(),
  ClassesService.create(),
  QuizzesService.create(),
  SubmissionsService.create(),
  ReportServices.create(),
]);

// -----------------------------------------------------------------------------

final locator = GetIt.instance;

FlutterSecureStorage get storage => locator.get<FlutterSecureStorage>();

ChopperClient get _apiClient => locator.get<ChopperClient>();

T getApiService<T extends ChopperService>() {
  return _apiClient.getService<T>();
}

// -----------------------------------------------------------------------------

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  locator
    ..registerSingleton<FlutterSecureStorage>(
      const FlutterSecureStorage(
        aOptions: AndroidOptions(
          encryptedSharedPreferences: true,
          resetOnError: true,
        ),
      ),
    )
    ..registerSingleton<ChopperClient>(setUpClient(
      baseUrl: defaultBaseUrl,
      services: apiServices,
    ));

  runApp(
    const ProviderScope(
      child: SPMApp(),
    ),
  );
}

class SPMApp extends ConsumerWidget {
  const SPMApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Student Progress Monitor',
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
