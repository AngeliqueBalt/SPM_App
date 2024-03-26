import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/user.dart';
import 'package:student_progress_monitor_app/providers/authentication_provider.dart';
import 'package:student_progress_monitor_app/providers/users_provider.dart';

class UserList extends ConsumerStatefulWidget {
  final UserType userType;

  const UserList({super.key, required this.userType});

  @override
  ConsumerState<UserList> createState() => _UserListState();
}

class _UserListState extends ConsumerState<UserList> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _idController;

  late final String _domain;

  bool _loading = false;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _idController = TextEditingController();
    final currentUser = ref.read(authenticationProvider).value!;
    _domain =
        RegExp(r'[^@]+(@.+)').firstMatch(currentUser.user.email)!.group(1)!;

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _idController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final users = ref.watch(usersProvider).requireValue;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "${widget.userType.label} List",
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: greenColor,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: RefreshIndicator(
        onRefresh: ref.read(usersProvider.notifier).refresh,
        child: SafeArea(
          child: Scrollbar(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (final user in users.where((final user) =>
                          user.userType == widget.userType)) ...[
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
                                    "Full Name: ${user.name}",
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Email: ${user.email}",
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  if (user.idNumber != null) ...[
                                    const SizedBox(height: 10),
                                    Text(
                                      "ID Number: ${user.idNumber}",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                  const SizedBox(height: 15),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: Column(
                                  children: [
                                    if (_loading)
                                      const Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Center(
                                            child: CircularProgressIndicator()),
                                      )
                                    else
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: IconButton(
                                          onPressed: () async {
                                            await showEditUserDialog(
                                                user: user);
                                          },
                                          icon: const Icon(Icons.edit),
                                        ),
                                      ),
                                    if (_loading)
                                      const Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Center(
                                            child: CircularProgressIndicator()),
                                      )
                                    else
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: IconButton(
                                          onPressed: () async {
                                            setState(() {
                                              _loading = true;
                                            });

                                            await ref
                                                .read(usersProvider.notifier)
                                                .removeUser(id: user.id);

                                            if (context.mounted) {
                                              context.pop();
                                            }
                                          },
                                          icon: const Icon(Icons.delete),
                                        ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> showEditUserDialog({required final User user}) async {
    await showDialog<void>(
      context: context,
      builder: (final context) => EditUserDialog(user: user),
    );
  }
}

class EditUserDialog extends ConsumerStatefulWidget {
  final User user;

  const EditUserDialog({super.key, required this.user});

  @override
  ConsumerState<EditUserDialog> createState() => _EditUserDialogState();
}

class _EditUserDialogState extends ConsumerState<EditUserDialog> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  bool _loading = false;
  late final String _domain;

  @override
  void initState() {
    super.initState();

    final currentUser = ref.read(authenticationProvider).value!;
    _domain =
        RegExp(r'[^@]+(@.+)').firstMatch(currentUser.user.email)!.group(1)!;

    _nameController.text = widget.user.name;
    _emailController.text = (widget.user.email).split(_domain).first;
    _idController.text = widget.user.idNumber ?? "";
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _idController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return AlertDialog(
      title: const Text("Edit user"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              enabled: !_loading,
              decoration: const InputDecoration(
                label: Text("Full Name"),
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
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
                border: const UnderlineInputBorder(),
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
            const SizedBox(height: 20),
            TextFormField(
              controller: _idController,
              enabled: !_loading,
              decoration: const InputDecoration(
                label: Text("ID Number"),
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: () async {
            if (!_formKey.currentState!.validate()) return;
            setState(() {
              _loading = true;
            });

            await ref.read(usersProvider.notifier).editUser(body: {
              "user": {
                "email": "${_emailController.text}$_domain",
                "name": _nameController.text,
                "idNumber": _idController.text,
              }
            }, id: widget.user.id);

            if (context.mounted) {
              context.pop();
            }
          },
          child: const Text("Save"),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        )
      ],
    );
  }
}
