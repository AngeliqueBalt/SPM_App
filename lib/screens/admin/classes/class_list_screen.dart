import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/class.dart';
import 'package:student_progress_monitor_app/providers/admin_class_provider.dart';

/// This screen is used by the admin to view a list of all classes.

class ClassList extends ConsumerStatefulWidget {
  final List<Class> clazzes;

  const ClassList({super.key, required this.clazzes});

  @override
  ConsumerState<ClassList> createState() => _AdminClassListState();
}

class _AdminClassListState extends ConsumerState<ClassList> {
  bool _loading = false;

  late final TextEditingController _nameController;
  late final TextEditingController _teacherController;
  late final MultiSelectController<String> _studentController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _teacherController = TextEditingController();
    _studentController = MultiSelectController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _teacherController.dispose();
    _studentController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "List of All Classes",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: greenColor,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: RefreshIndicator(
        onRefresh: ref.read(adminClassesProvider.notifier).refresh,
        child: SafeArea(
          child: Scrollbar(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (final clazz in widget.clazzes) ...[
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
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Column(
                                  children: [
                                    if (_loading)
                                      const Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Center(
                                            child: CircularProgressIndicator()),
                                      )
                                    else if (_loading)
                                      const Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
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
                                                .read(adminClassesProvider
                                                    .notifier)
                                                .removeClass(id: clazz.id);

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
}
