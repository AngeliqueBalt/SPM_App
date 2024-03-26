import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/user.dart';
import 'package:student_progress_monitor_app/providers/authentication_provider.dart';
import 'package:student_progress_monitor_app/providers/users_provider.dart';

/// This screen is used by the admin to add a new user to the system.

class AddNewUser extends ConsumerStatefulWidget {
  const AddNewUser({super.key});

  @override
  ConsumerState<AddNewUser> createState() => _RegisterNewUserState();
}

class _RegisterNewUserState extends ConsumerState<AddNewUser> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  UserType? _userType;

  late final String _domain;

  bool _loading = false;

  @override
  void initState() {
    final currentUser = ref.read(authenticationProvider).value!;
    _domain =
        RegExp(r'[^@]+(@.+)').firstMatch(currentUser.user.email)!.group(1)!;
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Add New User",
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

                  // user type
                  Container(
                    color: greenColor,
                    height: 30,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Select a type of user",
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
                    child: DropdownMenu(
                      enabled: !_loading,
                      width: 400,
                      requestFocusOnTap: true,
                      enableSearch: true,
                      enableFilter: true,
                      label: const Text("Type of user"),
                      onSelected: (final value) {
                        _userType = value;
                      },
                      dropdownMenuEntries: const <DropdownMenuEntry<UserType>>[
                        DropdownMenuEntry(
                            value: UserType.admin, label: "Admin"),
                        DropdownMenuEntry(
                            value: UserType.teacher, label: "Teacher"),
                        DropdownMenuEntry(
                            value: UserType.student, label: "Student"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  Container(
                    color: greenColor,
                    height: 30,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Enter the users full name",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Full name
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      enabled: !_loading,
                      controller: _nameController,
                      validator: (final value) => value?.trim().isEmpty ?? true
                          ? "You need to enter a full name"
                          : null,
                      decoration: const InputDecoration(
                        labelText: "Full Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  // id
                  const SizedBox(height: 20),
                  Container(
                    color: greenColor,
                    height: 30,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Enter the users ID",
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
                      controller: _idController,
                      validator: (final value) => value?.trim().isEmpty ?? true
                          ? "You need to enter an ID"
                          : null,
                      decoration: const InputDecoration(
                        labelText: "ID Number",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  // email
                  const SizedBox(height: 20),
                  Container(
                    color: greenColor,
                    height: 30,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Enter the users email",
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
                    child: TextFormField(
                      enabled: !_loading,
                      controller: _emailController,
                      validator: (final value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "You need to enter valid email";
                        }

                        if (value!.contains("@")) {
                          return "Don't include the domain";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: const OutlineInputBorder(),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 15),
                          child: Align(
                            alignment: Alignment.center,
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Text(_domain),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // password
                  const SizedBox(height: 20),
                  Container(
                    color: greenColor,
                    height: 30,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Enter the users password",
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
                      controller: _passwordController,
                      validator: (final value) => value?.trim().isEmpty ?? true
                          ? "You need to enter a password"
                          : null,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                      ),
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
                          await ref.read(usersProvider.notifier).addUser(body: {
                            "user": {
                              "email": "${_emailController.text}$_domain",
                              "name": _nameController.text,
                              "userType": _userType!.value,
                              "idNumber": _idController.text,
                            },
                            "password": _passwordController.text,
                          });

                          if (context.mounted) {
                            context.pop();
                          }
                        },
                        child: const Text("Create new user"),
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
