import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_progress_monitor_app/Screens/Teacher/Teacher_Home_Screen.dart';
import 'package:student_progress_monitor_app/screens/login_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/teacher_profile_screen.dart';

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
            accountName: Text(
              "Teacher Name",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            accountEmail: Text(
              "teacher@email.com",
              style: TextStyle(fontSize: 15),
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
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TeacherProfileScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Logout"),
            onTap: () => context.go('/'),
          )
        ],
      ),
    );
  }
}
