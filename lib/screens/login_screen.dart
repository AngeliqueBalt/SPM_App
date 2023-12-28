import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_progress_monitor_app/Screens//home_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage("lib/assets/images/Logo.png"),
                  height: 150,
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
                  decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    prefixIcon:
                        const Icon(Icons.person_outline, color: Colors.grey),
                    hintText: "Email",
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                  ),
                ),

                const SizedBox(height: 30),

                // Password text field
                TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      prefixIcon:
                          const Icon(Icons.lock_outline, color: Colors.grey),
                      hintText: "Password",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.2)),
                ),

                const SizedBox(height: 30),

                // forgot password?
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text("Forgot Password?",
                //           style: TextStyle(color: Colors.grey[700])),
                //     ],
                //   ),
                // ),

                const SizedBox(height: 30),

                // Log in button
                GestureDetector(
                  onTap: () => context.go('/dashboard'),
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: const Color(0xFF99C24D),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
