import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/custom_tile.dart';
import 'package:uccd/Features/Profile/Presentation/Views/logs_view.dart';
import 'package:uccd/generated/l10n.dart';

class LogsTile extends StatelessWidget {
  const LogsTile({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return CustomTile(
      title: S.of(context).logs,
      icon: Icons.manage_history,
      onTap: () async {
        await context.push(LogsView.id);
      },
    );
  }
}
