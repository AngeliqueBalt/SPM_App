import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_progress_monitor_app/routes.dart';
import 'package:student_progress_monitor_app/screens/login_screen.dart';
import 'package:student_progress_monitor_app/screens/home_screen.dart';
import 'package:student_progress_monitor_app/screens/profile_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // Would pull teacher name and email from server
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text(
              "Name",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            accountEmail: Text(
              "email@school.com",
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
                  builder: (context) => const HomeScreen(),
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
                  builder: (context) => const ProfileScreen(),
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
