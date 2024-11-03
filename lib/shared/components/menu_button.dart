import 'package:expense_manager/features/drawer/presentation/providers/drawer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuButton extends ConsumerWidget {
  final IconData icon;
  const MenuButton({required this.icon, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    return IconButton(
      icon: FaIcon(
        icon,
      ),
      onPressed: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
        ref.read(drawerProvider.notifier).openDrawer();
      },
      color: theme.colorScheme.onPrimary,
    );
  }
}
