import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/models/user.dart';

/// Allows the user to view their profile details.

class ProfileScreen extends StatefulWidget {
  final User user;

  const ProfileScreen({
    super.key,
    required this.user,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isObscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Profile",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: const Color(0xFF99C24D),
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
                buildTextField("Full Name", widget.user.name, false),
                const SizedBox(height: 20),
                buildTextField("Email", widget.user.email, false),
                const SizedBox(height: 20),
                buildTextField("ID number", "${widget.user.idNumber}", false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        readOnly: true,
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
          // suffixIcon: isPasswordTextField
          //     ? IconButton(
          //         onPressed: () {
          //           setState(() {
          //             isObscurePassword = !isObscurePassword;
          //           });
          //         },
          //         icon: const Icon(
          //           Icons.remove_red_eye,
          //           color: Colors.grey,
          //         ),
          //       )
          //     : null,
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
