import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/domain/exception.dart';
import 'package:student_progress_monitor_app/providers/authentication_provider.dart';
import 'package:student_progress_monitor_app/routes.dart';

class LogInScreen extends ConsumerStatefulWidget {
  const LogInScreen({super.key});

  @override
  ConsumerState<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends ConsumerState<LogInScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool _loading = false;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // logo
                  const Image(
                    image: AssetImage("assets/icon.png"),
                    height: 128,
                  ),
                  const SizedBox(height: 50),

                  // App name and log in text
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Student Progress Monitor",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      SizedBox(width: 10),
                      Text("Log In",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Username text field
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      prefixIcon:
                          const Icon(Icons.person_outline, color: Colors.grey),
                      labelText: "Email",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.2),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Password text field
                  TextFormField(
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      prefixIcon:
                          const Icon(Icons.lock_outline, color: Colors.grey),
                      labelText: "Password",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.2),
                    ),
                  ),

                  const SizedBox(height: 30),
                  // Log in button
                  if (_loading)
                    const Padding(
                      padding: EdgeInsets.only(top: 36.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  else
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          _loading = true;
                        });
                        try {
                          await ref.read(authenticationProvider.notifier).login(
                                email: _email.text,
                                password: _password.text,
                              );
                          if (context.mounted) {
                            setState(() {
                              _loading = false;
                            });
                          }
                        } on SPMException catch (ex) {
                          if (routerKey.currentContext?.mounted ?? false) {
                            WidgetsBinding.instance
                                .addPostFrameCallback((final _) async {
                              setState(() {
                                _loading = false;
                              });
                              await showDialog<String>(
                                context: routerKey.currentContext!,
                                builder: (final context) => AlertDialog(
                                  title: const Text("An error has occurred"),
                                  content: Text(ex.message),
                                  actions: [
                                    OutlinedButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Try Again"),
                                    ),
                                  ],
                                ),
                              );
                            });
                          } else {
                            setState(() {
                              _loading = true;
                            });
                          }
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(25),
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            "Log In",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
