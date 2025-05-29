import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Use theme colors for dynamic light/dark mode support
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color;
    final backgroundColor = theme.scaffoldBackgroundColor;
    final dividerColor = theme.dividerColor;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Text(
                'Menu',
                style: theme.textTheme.titleLarge?.copyWith(color: textColor),
              ),
            ),
            Divider(color: dividerColor, thickness: 1),
            Expanded(
              child: ListView(
                children: [
                  _buildMenuItem(context, 'Profiles', () {
                    // TODO: Navigate to Profiles page
                  }),
                  _buildMenuItem(context, 'Settings', () {
                    // TODO: Navigate to Settings page
                  }),
                  _buildMenuItem(context, 'Set 1RM Maxes', () {
                    // TODO: Navigate to Set 1RM Maxes page
                  }),
                  _buildMenuItem(context, 'Add lift', () {
                    // TODO: Navigate to Add lift page
                  }),
                  _buildMenuItem(context, 'Logs', () {
                    // TODO: Navigate to Logs page
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, VoidCallback onTap) {
    final theme = Theme.of(context);
    return ListTile(
      title: Text(
        title,
        style: theme.textTheme.titleMedium,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    );
  }
}
