import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/providers/authentication_provider.dart';

/// Allows the user to view their profile details.

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool isObscurePassword = true;

  @override
  Widget build(final BuildContext context) {
    final user = ref.watch(authenticationProvider).requireValue!.user;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Profile",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: greenColor,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                const SizedBox(height: 30),
                buildTextField("Full Name", user.name, false),
                const SizedBox(height: 10),
                buildTextField("Email", user.email, false),
                if (user.idNumber != null) ...[
                  const SizedBox(height: 10),
                  buildTextField("ID Number", user.idNumber!, false),
                ],
                const SizedBox(height: 10),
                buildTextField("Account Type", user.userType.label, false)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(final String labelText, final String placeholder,
      final bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        readOnly: true,
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
