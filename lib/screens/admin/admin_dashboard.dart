import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_progress_monitor_app/components/navbar.dart';
import 'package:student_progress_monitor_app/components/option_card.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/class.dart';
import 'package:student_progress_monitor_app/models/user.dart';
import 'package:student_progress_monitor_app/providers/admin_class_provider.dart';
import 'package:student_progress_monitor_app/providers/users_provider.dart';
import 'package:student_progress_monitor_app/screens/admin/classes/class_list_screen.dart';
import 'package:student_progress_monitor_app/screens/admin/classes/add_new_class.dart';
import 'package:student_progress_monitor_app/screens/admin/users/add_new_user.dart';
import 'package:student_progress_monitor_app/screens/admin/users/user_list_screen.dart';

class AdminDashboard extends ConsumerWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final users = ref.watch(usersProvider.future);
    final classes = ref.watch(adminClassesProvider.future);

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
      body: RefreshIndicator(
        onRefresh: ref.read(usersProvider.notifier).refresh,
        child: SafeArea(
          child: FutureBuilder(
              future: Future.wait([users, classes]),
              builder: (final context, final snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final users = snapshot.data![0] as List<User>;
                final classes = snapshot.data![1] as List<Class>;

                return SingleChildScrollView(
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
                      OptionCard(
                        label: "All Students",
                        color: greenColor,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (final context) => UserList(
                                  users: users, userType: UserType.student),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      OptionCard(
                        label: "All Teachers",
                        color: greenColor,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (final context) => UserList(
                                  users: users, userType: UserType.teacher),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      OptionCard(
                        label: "All Admin",
                        color: greenColor,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (final context) => UserList(
                                  users: users, userType: UserType.admin),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
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
                      OptionCard(
                        label: "All Classes",
                        color: greenColor,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (final context) =>
                                  ClassList(clazzes: classes),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
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
                );
              }),
        ),
      ),
    );
  }
}
