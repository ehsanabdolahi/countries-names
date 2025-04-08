import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginSelectorPage extends StatelessWidget {
  const LoginSelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Login Style'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select a login style:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 32),
            _buildLoginOption(
              context,
              'Simple Login',
              'Clean and minimalist design',
              Icons.login,
                  () => context.go('/login/simple'),
            ),
            const SizedBox(height: 16),
            _buildLoginOption(
              context,
              'Modern Login',
              'Stylish design with animations',
              Icons.auto_awesome,
                  () => context.go('/login/modern'),
            ),
            const SizedBox(height: 16),
            _buildLoginOption(
              context,
              'Professional Login',
              'Advanced features and validations',
              Icons.verified_user,
                  () => context.go('/login/professional'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginOption(
      BuildContext context,
      String title,
      String subtitle,
      IconData icon,
      VoidCallback onTap,
      ) {
    return SizedBox(
      width: 300,
      child: Card(
        elevation: 4,
        child: ListTile(
          leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
      ),
    );
  }
}