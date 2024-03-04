import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:student_progress_monitor_app/data/network/class_management.dart';
import 'package:student_progress_monitor_app/data/network/classes.dart';
import 'package:student_progress_monitor_app/data/network/user_management.dart';
import 'package:student_progress_monitor_app/data/network/authentication.dart';
import 'package:student_progress_monitor_app/data/network/network.dart';
import 'package:student_progress_monitor_app/data/network/users.dart';
import 'package:student_progress_monitor_app/routes.dart';

const FlutterSecureStorage storage = FlutterSecureStorage(
  aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
    resetOnError: true,
  ),
);

final _apiClient = setUpClient(
  services: [
    AuthenticationService.create(),
    UsersService.create(),
    UserManagementService.create(),
    ClassManagementService.create(),
    ClassesService.create(),
  ],
);

T getApiService<T extends ChopperService>() {
  return _apiClient.getService<T>();
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      // home: const LogInScreen(),
    );
  }
}
