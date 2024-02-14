import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/components/navbar.dart';
import 'package:student_progress_monitor_app/components/option_card.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/user.dart';
import 'package:student_progress_monitor_app/screens/admin/admin_list_screen.dart';
import 'package:student_progress_monitor_app/screens/admin/class_list_screen.dart';
import 'package:student_progress_monitor_app/screens/admin/register_new_class.dart';
import 'package:student_progress_monitor_app/screens/admin/register_new_user.dart';
import 'package:student_progress_monitor_app/screens/admin/student_list_screen.dart';
import 'package:student_progress_monitor_app/screens/admin/teacher_list_screen.dart';

class AdminDashboard extends StatelessWidget {
  final List<User> teachers;

  const AdminDashboard({super.key, required this.teachers});

  @override
  Widget build(BuildContext context) {
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
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              OptionCard(
                label: "View and Edit Students List",
                color: greenColor,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AdminStudentList(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              OptionCard(
                label: "View and Edit Teachers List",
                color: greenColor,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          AdminTeacherList(teachers: teachers),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              OptionCard(
                label: "View and Edit Admin List",
                color: greenColor,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AdminList(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              OptionCard(
                label: "Register New User",
                color: greenColor,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RegisterNewUser(),
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
              OptionCard(
                label: "View and Edit Classes List",
                color: greenColor,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AdminClassList(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              OptionCard(
                label: "Register New Class",
                color: greenColor,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RegisterNewClass(),
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
