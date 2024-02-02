import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_progress_monitor_app/data/classes.dart';
import 'package:student_progress_monitor_app/data/users.dart';
import 'package:student_progress_monitor_app/models/class_model.dart';
import 'package:student_progress_monitor_app/models/user_model.dart';
import 'package:student_progress_monitor_app/routes.dart';
import 'package:student_progress_monitor_app/screens/home_screen.dart';
import 'package:student_progress_monitor_app/screens/profile_screen.dart';

/// The navigation bar that appears on the left side of the screen.
/// It contains the user's name, email, and a list of options to navigate to.

class NavBar extends StatefulWidget {
  const NavBar({super.key, required this.user, required this.classes});

  final UserModel user;
  final List<ClassModel> classes;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // TODO: pull name and email from database
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            // TODO: get name from database
            accountName: Text(
              widget.user.name,
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            accountEmail: Text(
              // TODO: get email from database
              widget.user.email,
              style: const TextStyle(fontSize: 15),
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF99C24D),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text("Classes"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomeScreen(
                    user: user,
                    classes: classes,
                  ),
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
                  builder: (context) => ProfileScreen(user: user),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Logout"),
            onTap: () => {
              // TODO: Make it that when pressed isAuthenicated is set to false
              // setState(() {
              //   isAuthenticated == false;
              // }),
              context.go('/'),
            },
          )
        ],
      ),
    );
  }
}
