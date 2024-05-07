import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

(Widget, ProviderContainer) createScopedWidget({
  final ProviderContainer? parent,
  final List<Override> overrides = const [],
  final List<ProviderObserver> observers = const [],
  required final Widget child,
}) {
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );

  addTearDown(container.dispose);

  return (
    UncontrolledProviderScope(
      container: container,
      child: child,
    ),
    container
  );
}
