import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/Screens/Teacher/Teacher_Home_Screen.dart';
import 'package:student_progress_monitor_app/screens/login_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/teacher_quiz_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/teacher_students_list_screen.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  // Would pull teacher name and email from server

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Teacher Name"),
            accountEmail: Text("teacher@email.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "T",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF99C24D),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text("Classes"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TeacherHomeScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.quiz),
            title: const Text("Manage Quizzes"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TeacherQuizScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Logout"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const LogInScreen(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
