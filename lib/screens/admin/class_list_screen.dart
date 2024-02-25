import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/data/mock/users.dart';
import 'package:student_progress_monitor_app/models/class.dart';
import 'package:student_progress_monitor_app/models/user.dart';

class AdminClassList extends StatelessWidget {
  final List<Class> clazzes;

  const AdminClassList({super.key, required this.clazzes});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Class List",
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
              for (final clazz in clazzes) ...[
                const Divider(
                  color: Colors.grey,
                  height: 0,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 15),
                          Text(
                            "Class: ${clazz.name}",
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Teacher: ${clazz.teacher.name}",
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 15),
                          // Text(
                          //   "Students: ${clazz.students}",
                          //   style: const TextStyle(fontSize: 12),
                          // ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () async {
                                await showDialog<void>(
                                  context: context,
                                  builder: (final context) => AlertDialog(
                                    title: const Text("Edit class"),
                                    content: Column(
                                      children: [
                                        const TextField(
                                          decoration: InputDecoration(
                                            hintText: "Class Name",
                                            border: UnderlineInputBorder(),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        DropdownMenu<User>(
                                            width: 250,
                                            requestFocusOnTap: true,
                                            enableSearch: true,
                                            enableFilter: true,
                                            hintText: "Teacher",
                                            dropdownMenuEntries: users
                                                .where((final user) =>
                                                    user.userType ==
                                                    UserType.teacher)
                                                .map((final user) =>
                                                    DropdownMenuEntry(
                                                        value: user,
                                                        label:
                                                            "${user.name} (${user.idNumber})"))
                                                .toList()),
                                      ],
                                    ),
                                    actions: [
                                      OutlinedButton(
                                        onPressed: () {},
                                        child: const Text("Save"),
                                      ),
                                      OutlinedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Cancel"),
                                      )
                                    ],
                                  ),
                                );
                              },
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                // TODO(A): MAKE DELETE REQUEST
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
