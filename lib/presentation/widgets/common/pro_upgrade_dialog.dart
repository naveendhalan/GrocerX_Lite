import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProUpgradeDialog extends StatelessWidget {
  const ProUpgradeDialog({super.key, required this.featureName});

  final String featureName;

  static Future<void> show({String featureName = 'This feature'}) {
    return Get.dialog<void>(
      ProUpgradeDialog(featureName: featureName),
      barrierDismissible: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Row(
        children: [
          Icon(Icons.workspace_premium, color: theme.colorScheme.primary),
          const SizedBox(width: 8),
          Text(
            'Premium Feature',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
      content: Text(
        '$featureName is only available in GrocerX Pro. Get the full source code to unlock.',
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
          height: 1.4,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back<void>(),
          child: const Text('Close'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back<void>();
            Get.snackbar(
              'Upgrade to Pro',
              'Contact us to get the full GrocerX Pro source code.',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: theme.colorScheme.primaryContainer,
              colorText: theme.colorScheme.onPrimaryContainer,
              margin: const EdgeInsets.all(16),
              borderRadius: 12,
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary,
          ),
          child: const Text('Get Pro'),
        ),
      ],
    );
  }
}
