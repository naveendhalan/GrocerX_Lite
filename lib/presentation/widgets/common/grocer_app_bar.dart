import 'dart:io';

import 'package:flutter/material.dart';

/// A cross-platform [AppBar] with consistent back button behavior.
///
/// Key behaviors:
/// - Uses `Icons.adaptive.arrow_back` for iOS/Android consistency.
/// - Explicitly sets `foregroundColor`/`iconTheme` so the icon is never invisible.
/// - Shows the back button only when `Navigator.of(context).canPop()` is true.
/// - Disables `automaticallyImplyLeading` to avoid platform/theme differences.
class GrocerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GrocerAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.backgroundColor,
    this.elevation = 0,
    this.centerTitle = false,
  });

  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;
  final double elevation;
  final bool centerTitle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final canPop = Navigator.of(context).canPop();

    final iconColor = theme.colorScheme.onSurface;
    final Widget? resolvedLeading = leading ??
        (Platform.isIOS && canPop
            ? IconButton(
                icon: Icon(Icons.adaptive.arrow_back, color: iconColor),
                onPressed: () => Navigator.of(context).maybePop(),
              )
            : null);

    return AppBar(
      title: title,
      actions: actions,
      leading: resolvedLeading,
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? theme.colorScheme.surface,
      elevation: elevation,
      foregroundColor: iconColor,
      iconTheme: IconThemeData(color: iconColor),
    );
  }
}

