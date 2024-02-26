import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/user.dart';
import 'package:student_progress_monitor_app/providers/authentication_provider.dart';
import 'package:student_progress_monitor_app/providers/users_provider.dart';

class UserList extends ConsumerStatefulWidget {
  final List<User> users;
  final UserType userType;

  const UserList({super.key, required this.users, required this.userType});

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
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (final user in widget.users.where(
                        (final user) => user.userType == widget.userType)) ...[
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
                                          await showDialog<void>(
                                            context: context,
                                            builder: (final context) =>
                                                AlertDialog(
                                              title: const Text("Edit user"),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  TextField(
                                                    controller: _nameController,
                                                    decoration:
                                                        const InputDecoration(
                                                      label: Text("Full Name"),
                                                      border:
                                                          UnderlineInputBorder(),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  TextField(
                                                    controller:
                                                        _emailController,
                                                    decoration:
                                                        const InputDecoration(
                                                      label: Text("Email"),
                                                      border:
                                                          UnderlineInputBorder(),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  TextField(
                                                    controller: _idController,
                                                    decoration:
                                                        const InputDecoration(
                                                      label: Text("ID Number"),
                                                      border:
                                                          UnderlineInputBorder(),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                ],
                                              ),
                                              actions: [
                                                OutlinedButton(
                                                  onPressed: () async {
                                                    await ref
                                                        .read(usersProvider
                                                            .notifier)
                                                        .editUser(body: {
                                                      "user": {
                                                        "email":
                                                            "${_emailController.text}$_domain",
                                                        "name": _nameController
                                                            .text,
                                                        "idNumber":
                                                            _idController.text,
                                                      }
                                                    }, id: user.id);

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
                                            ),
                                          );
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
    );
  }
}
