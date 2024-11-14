import 'package:flutter/material.dart';

enum WindowsSize {
  compact,
  medium,
  expanded,
}

extension BuildContextExtension on BuildContext {
  WindowsSize get windowsSize => switch (MediaQuery.sizeOf(this).width) {
        < 600 => WindowsSize.compact,
        >= 600 && < 840 => WindowsSize.medium,
        _ => WindowsSize.expanded,
      };

  double get contentWidth => MediaQuery.sizeOf(this).width >= 1280
      ? 1280
      : MediaQuery.sizeOf(this).width;

  Future<T?> show<T>(Widget dialog) => showDialog(
        context: this,
        builder: (context) => dialog,
      );
}
