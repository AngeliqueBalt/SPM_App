import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncBuilder<T> extends StatelessWidget {
  final AsyncValue<T> Function(WidgetRef ref) selector;
  final Widget Function(BuildContext context, T value) builder;
  final Widget Function(BuildContext context, Widget child, T? value)?
      shellBuilder;

  const AsyncBuilder({
    super.key,
    required this.selector,
    required this.builder,
    this.shellBuilder,
  });

  @override
  Widget build(final BuildContext context) {
    return Consumer(
      builder: (final BuildContext context, final WidgetRef ref, final _) {
        final value = selector(ref);
        final shell = shellBuilder != null
            ? (final Widget child) =>
                shellBuilder!(context, child, value.valueOrNull)
            : (final Widget child) => child;

        return value.when(
          data: (final value) {
            return shell(builder(context, value));
          },
          error: (final error, final stackTrace) {
            if (kDebugMode) {
              print(value.error);
              print(value.stackTrace);
            }

            return shell(
              SafeArea(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.error,
                        size: 40,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "An error has occurred!",
                        style: TextStyle(fontSize: 20),
                      ),
                      if (kDebugMode) Text(value.error.toString()),
                    ],
                  ),
                ),
              ),
            );
          },
          loading: () => shell(
            const SafeArea(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
      },
    );
  }
}
