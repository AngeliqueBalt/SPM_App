import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/user.dart';
import 'package:student_progress_monitor_app/providers/admin_class_provider.dart';
import 'package:student_progress_monitor_app/providers/users_provider.dart';

class AddNewClass extends ConsumerStatefulWidget {
  const AddNewClass({super.key});

  @override
  ConsumerState<AddNewClass> createState() => _AddNewClassState();
}

class _AddNewClassState extends ConsumerState<AddNewClass> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _classNameController;
  late final TextEditingController _teacherNameController;
  late final MultiSelectController<String> _studentController;

  String? _teacherId;

  bool _loading = false;

  @override
  void initState() {
    _classNameController = TextEditingController();
    _teacherNameController = TextEditingController();
    _studentController = MultiSelectController();
    super.initState();
  }

  @override
  void dispose() {
    _classNameController.dispose();
    _teacherNameController.dispose();
    _studentController.dispose();
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
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                      enabled: !_loading,
                      controller: _classNameController,
                      validator: (final value) => value?.trim().isEmpty ?? true
                          ? "You need to enter a class name"
                          : null,
                      decoration: const InputDecoration(
                        labelText: "Class Name",
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
                    child: DropdownMenu<String>(
                      enabled: !_loading,
                      controller: _teacherNameController,
                      width: 400,
                      requestFocusOnTap: true,
                      enableSearch: true,
                      enableFilter: true,
                      label: const Text("Teacher"),
                      onSelected: (final value) {
                        _teacherId = value;
                      },
                      dropdownMenuEntries: ref
                          .read(usersProvider)
                          .requireValue
                          .where(
                              (final user) => user.userType == UserType.teacher)
                          .map((final user) => DropdownMenuEntry(
                              value: user.id,
                              label: "${user.name} (${user.idNumber})"))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // students
                  Container(
                    color: greenColor,
                    height: 30,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Enter the list of students",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MultiSelectDropDown(
                      hint: "Select student(s)",
                      controller: _studentController,
                      onOptionSelected: (final options) {
                        options.toString();
                      },
                      options: ref
                          .read(usersProvider)
                          .requireValue
                          .where(
                              (final user) => user.userType == UserType.student)
                          .map((final user) => ValueItem(
                              value: user.id,
                              label: "${user.name} (${user.idNumber})"))
                          .toList(),
                      selectionType: SelectionType.multi,
                      chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                      dropdownHeight: 300,
                      optionTextStyle: const TextStyle(fontSize: 16),
                      selectedOptionIcon: const Icon(Icons.check_circle),
                    ),
                  ),

                  const SizedBox(height: 20),
                  if (_loading)
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  else
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
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) return;
                          setState(() {
                            _loading = true;
                          });
                          await ref
                              .read(adminClassesProvider.notifier)
                              .addClass(body: {
                            "name": _classNameController.text,
                            "teacher": _teacherId,
                            "students": _studentController.selectedOptions
                                .map((final selectedOption) =>
                                    selectedOption.value)
                                .toList(),
                          });

                          if (context.mounted) {
                            context.pop();
                          }
                        },
                        child: const Text("Create new class"),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
