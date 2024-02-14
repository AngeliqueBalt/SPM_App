import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/const/design.dart';

class RegisterNewUser extends StatelessWidget {
  const RegisterNewUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Add New User",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: greenColor,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // user type
                const Text("Select a user type"),
                const DropdownMenu(
                  width: 370,
                  enableSearch: false,
                  dropdownMenuEntries: <DropdownMenuEntry<String>>[
                    DropdownMenuEntry(value: "Admin", label: "Admin"),
                    DropdownMenuEntry(value: "Teacher", label: "Teacher"),
                    DropdownMenuEntry(value: "Student", label: "Student"),
                  ],
                ),

                const SizedBox(height: 20),

                // Full name
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter Full Name",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                // email
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                // password
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter Password",
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
