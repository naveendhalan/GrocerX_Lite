import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/profile/profile_controller.dart';
import '../../widgets/common/grocer_app_bar.dart';
import '../../widgets/common/pro_upgrade_dialog.dart';
import '../../widgets/profile/profile_button.dart';
import '../../widgets/profile/profile_card.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: GrocerAppBar(
        title: Text(
          'Profile',
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: theme.colorScheme.onSurface),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ProfileCard(),
              const SizedBox(height: 24),
              ProfileButton(
                icon: Icons.receipt_long,
                title: 'My Orders',
                subtitle: 'Track and review your purchases',
                onTap: () => ProUpgradeDialog.show(featureName: 'Order History'),
              ),
              const SizedBox(height: 12),
              ProfileButton(
                icon: Icons.location_on,
                title: 'Shipping Addresses',
                subtitle: 'Manage delivery locations',
                onTap: () => ProUpgradeDialog.show(featureName: 'Shipping Addresses'),
              ),
              const SizedBox(height: 12),
              ProfileButton(
                icon: Icons.credit_card,
                title: 'Payment Methods',
                subtitle: 'Saved cards and wallets',
                onTap: () => ProUpgradeDialog.show(featureName: 'Payment Methods'),
              ),
              const SizedBox(height: 12),
              ProfileButton(
                icon: Icons.edit,
                title: 'Edit Profile',
                subtitle: 'Update your personal information',
                onTap: () => ProUpgradeDialog.show(featureName: 'Edit Profile'),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.logout,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.errorContainer,
                    foregroundColor: theme.colorScheme.onErrorContainer,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 2,
                    shadowColor: Colors.black12.withValues(alpha: 0.08),
                  ),
                  child: Text(
                    'Logout',
                    style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onErrorContainer, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
