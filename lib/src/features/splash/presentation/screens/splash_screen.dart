import 'package:flutter/material.dart';
import '../../../../src.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  Future<void> _navigateToNext() async {
    // Initial check for auth status
    di<AuthCubit>().checkAuthStatus();
    
    // Simulate some loading
    await Future.delayed(const Duration(seconds: 2));
    
    if (mounted) {
      final authState = di<AuthCubit>().state;
      if (authState is AuthAuthenticated) {
        Navigator.pushReplacementNamed(context, Routes.kHome);
      } else {
        Navigator.pushReplacementNamed(context, Routes.kLogin);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.delivery_dining,
              size: 100,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            Text(
              'QuickDelivery',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            const CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
