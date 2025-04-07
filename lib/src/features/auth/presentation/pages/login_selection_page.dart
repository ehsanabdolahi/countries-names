import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';

class LoginSelectionPage extends StatelessWidget {
  const LoginSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Login Type'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select a Login Style',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            _buildLoginTypeButton(
              context,
              'Simple Login',
              'Clean and minimal design',
              Icons.login,
              Colors.blue,
                  () => Navigator.pushNamed(context, AppRoutes.loginType1Route),
            ),
            const SizedBox(height: 16),
            _buildLoginTypeButton(
              context,
              'Modern Login',
              'Gradient background with card layout',
              Icons.gradient,
              Colors.purple,
                  () => Navigator.pushNamed(context, AppRoutes.loginType2Route),
            ),
            const SizedBox(height: 16),
            _buildLoginTypeButton(
              context,
              'Creative Login',
              'With image header and social login',
              Icons.image,
              Colors.deepPurple,
                  () => Navigator.pushNamed(context, AppRoutes.loginType3Route),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginTypeButton(
      BuildContext context,
      String title,
      String subtitle,
      IconData icon,
      Color color,
      VoidCallback onPressed,
      ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}