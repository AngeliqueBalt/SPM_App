import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget getWidget(final Finder finder) {
  final candidates = finder.evaluate();
  if (candidates.length != 1) {
    throw Exception(
      'Expected to find exactly one widget, but found ${candidates.length}',
    );
  }
  return candidates.first.widget;
}

Finder collectively(final Iterable<Finder> finders) => MultiFinder(finders);

extension AdditionalCommonFinders on CommonFinders {
  Finder any() => byWidgetPredicate((final _) => true,
      description: 'any type or properties');

  Finder byLabel(final String text) => byWidgetPredicate(
      (final widget) =>
          widget is TextField &&
          widget.decoration != null &&
          widget.decoration is InputDecoration &&
          (((widget.decoration as InputDecoration).labelText == text) ||
              (widget.decoration!.label != null &&
                  collectively([
                        find.byWidget(widget.decoration!.label!),
                        find.text(text)
                      ]).evaluate().length ==
                      1)),
      description: 'label "$text"');

  Finder byHint(final String text) => byWidgetPredicate(
      (final widget) =>
          widget is TextField &&
          widget.decoration != null &&
          widget.decoration is InputDecoration &&
          (widget.decoration as InputDecoration).hintText == text,
      description: 'hint "$text"');

  Finder skip(final int size, final Finder finder) =>
      SkipFinder(finder, size: size);
}

class MultiFinder extends Finder {
  final Iterable<Finder> finders;

  MultiFinder(this.finders);

  @override
  String get description => finders.map((final f) => f.description).join(', ');

  @override
  Iterable<Element> findInCandidates(Iterable<Element> candidates) {
    for (final finder in finders) {
      finder.evaluate();
      candidates = finder.findInCandidates(candidates);
      if (candidates.isEmpty) return candidates;
    }

    return candidates;
  }
}

class SkipFinder extends Finder {
  final Finder finder;
  final int size;

  SkipFinder(this.finder, {required this.size});

  @override
  String get description => 'skip $size ${finder.description}';

  @override
  Iterable<Element> findInCandidates(final Iterable<Element> candidates) {
    final candidates = finder.evaluate();
    return candidates.skip(1);
  }
}
