import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/data/mock/users.dart';
import 'package:student_progress_monitor_app/models/user.dart';

class AddNewClass extends StatefulWidget {
  const AddNewClass({super.key});

  @override
  State<AddNewClass> createState() => _AddNewClassState();
}

class _AddNewClassState extends State<AddNewClass> {
  late final TextEditingController _classNameController;
  late final TextEditingController _teacherNameController;

  @override
  void initState() {
    _classNameController = TextEditingController();
    _teacherNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _classNameController.dispose();
    _teacherNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Add New Class",
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

              // class name
              Container(
                color: greenColor,
                height: 30,
                child: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Enter the class name",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _classNameController,
                  validator: (final value) => value?.trim().isEmpty ?? true
                      ? "You need to enter a class name"
                      : null,
                  decoration: const InputDecoration(
                    hintText: "Class Name",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // class teacher
              Container(
                color: greenColor,
                height: 30,
                child: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Enter the class teacher",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownMenu<User>(
                    controller: _teacherNameController,
                    width: 400,
                    requestFocusOnTap: true,
                    enableSearch: true,
                    enableFilter: true,
                    hintText: "Teacher",
                    dropdownMenuEntries: users
                        .where(
                            (final user) => user.userType == UserType.teacher)
                        .map((final user) => DropdownMenuEntry(
                            value: user,
                            label: "${user.name} (${user.idNumber})"))
                        .toList()),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: OutlinedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // TODO(A): MAKE POST REQUEST
                  },
                  child: const Text("Create new class"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
