import 'package:flutter/material.dart';

// A provider class to access the TabController globally
class TabControllerProvider extends InheritedWidget {
  final TabController tabController;

  const TabControllerProvider({
    super.key,
    required this.tabController,
    required super.child,
  });

  // Convenience method to get the TabController
  static TabController of(BuildContext context) {
    final TabControllerProvider? result =
        context.dependOnInheritedWidgetOfExactType<TabControllerProvider>();
    if (result != null) return result.tabController;
    throw FlutterError.fromParts(<DiagnosticsNode>[
      ErrorSummary(
        'TabControllerProvider.of() called with a context that does not contain a TabControllerProvider.',
      ),
      ErrorHint(
        'No TabControllerProvider ancestor could be found starting from the context that was passed '
        'to TabControllerProvider.of(). This can happen because you do not have a TabControllerProvider '
        'widget at the top of your application widget tree.',
      ),
    ]);
  }

  // This method is called when a dependent widget needs to be rebuilt
  @override
  bool updateShouldNotify(TabControllerProvider oldWidget) {
    return tabController != oldWidget.tabController;
  }
}
