import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/user.dart';

class UserList extends StatefulWidget {
  final List<User> users;
  final UserType userType;

  const UserList({super.key, required this.users, required this.userType});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _idController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _idController = TextEditingController();
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
  Widget build(BuildContext context) {
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var user in widget.users
                  .where((user) => user.userType == widget.userType)) ...[
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
                            IconButton(
                              onPressed: () async {
                                await showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("Edit user"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          controller: _nameController,
                                          decoration: const InputDecoration(
                                            label: Text("Full Name"),
                                            border: UnderlineInputBorder(),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        TextField(
                                          controller: _emailController,
                                          decoration: InputDecoration(
                                            label: Text("Email"),
                                            border: UnderlineInputBorder(),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        TextField(
                                          controller: _idController,
                                          decoration: InputDecoration(
                                            label: Text("ID Number"),
                                            border: UnderlineInputBorder(),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                      ],
                                    ),
                                    actions: [
                                      OutlinedButton(
                                        onPressed: () {
                                          // TODO: MAKE UPDATE REQUEST
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
                            IconButton(
                              onPressed: () {
                                // TODO: MAKE DELETE REQUEST
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
