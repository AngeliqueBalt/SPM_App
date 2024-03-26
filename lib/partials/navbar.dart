import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/class.dart';
import 'package:student_progress_monitor_app/providers/authentication_provider.dart';
import 'package:student_progress_monitor_app/screens/profile_screen.dart';

/// The navigation bar that appears on the left side of the screen.
/// This widget allows the user to navigate to different parts of the app,
/// such as the profile screen and the logout screen.
/// It also displays the user's name and email.

class NavBar extends ConsumerWidget {
  const NavBar({super.key, this.classes});

  final List<Class>? classes;

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final currentUser = ref.watch(authenticationProvider);
    final user = currentUser.requireValue!.user;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              user.name,
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            accountEmail: Text(
              user.email,
              style: const TextStyle(fontSize: 15),
            ),
            decoration: const BoxDecoration(
              color: greenColor,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (final context) => ProfileScreen(user: user),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Logout"),
            onTap: () {
              ref.read(authenticationProvider.notifier).logout();
            },
          )
        ],
      ),
    );
  }
}
