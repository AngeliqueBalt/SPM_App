import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/partials/navbar.dart';
import 'package:student_progress_monitor_app/partials/option_card.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/user.dart';
import 'package:student_progress_monitor_app/screens/admin/classes/class_list_screen.dart';
import 'package:student_progress_monitor_app/screens/admin/classes/add_new_class.dart';
import 'package:student_progress_monitor_app/screens/admin/users/add_new_user.dart';
import 'package:student_progress_monitor_app/screens/admin/users/user_list_screen.dart';

/// This is the admin dashboard screen.
/// It displays a list of options for the admin to choose from.
/// The options include:
/// - Viewing all students
/// - Viewing all teachers
/// - Viewing all admins
/// - Adding a new user
/// - Viewing all classes
/// - Adding a new class

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Dashboard",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: greenColor,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Container(
                color: greenColor,
                height: 30,
                child: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Users",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Student list
              OptionCard(
                label: "All Students",
                color: greenColor,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (final context) =>
                          const UserList(userType: UserType.student),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              // Teacher list
              OptionCard(
                label: "All Teachers",
                color: greenColor,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (final context) =>
                          const UserList(userType: UserType.teacher),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              // Admin list
              OptionCard(
                label: "All Admins",
                color: greenColor,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (final context) =>
                          const UserList(userType: UserType.admin),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              // Add new user
              OptionCard(
                label: "Add New User",
                color: greenColor,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (final context) => const AddNewUser(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Container(
                color: greenColor,
                height: 30,
                child: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Classes",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Class list
              OptionCard(
                label: "All Classes",
                color: greenColor,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (final context) => const ClassList(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              // Add new class
              OptionCard(
                label: "Add New Class",
                color: greenColor,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (final context) => const AddNewClass(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
