import 'package:flutter/material.dart';

import 'package:collection/collection.dart';

extension IterableJoinWith<T extends Widget> on Iterable<T> {
  List<Widget> joinWith(Widget widget) => expandIndexed(
        (index, element) => index == 0 ? [element] : [widget, element],
      ).toList(growable: false);
}
