import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../bloc/auth/auth_bloc.dart';
import '../../shared/theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Simulate initialization time
    await Future.delayed(const Duration(seconds: 3));
    
    if (mounted) {
      final authState = context.read<AuthBloc>().state;
      
      if (authState is AuthAuthenticated) {
        context.go('/home');
      } else {
        context.go('/onboarding');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.primaryColor,
              AppTheme.primaryDarkColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App Icon with Animation
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.menu_book_rounded,
                    size: 60,
                    color: AppTheme.primaryColor,
                  ),
                )
                    .animate()
                    .scale(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.elasticOut,
                    )
                    .fadeIn(duration: const Duration(milliseconds: 600)),
                
                const SizedBox(height: 32),
                
                // App Name
                Text(
                  'Modern Quran',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 400))
                    .slideY(
                      begin: 0.3,
                      duration: const Duration(milliseconds: 600),
                    ),
                
                const SizedBox(height: 8),
                
                // Subtitle
                Text(
                  'Your Digital Islamic Companion',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.9),
                    letterSpacing: 0.5,
                  ),
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 600))
                    .slideY(
                      begin: 0.3,
                      duration: const Duration(milliseconds: 600),
                    ),
                
                const SizedBox(height: 80),
                
                // Loading Indicator
                SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white.withOpacity(0.8),
                    ),
                  ),
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 800))
                    .scale(duration: const Duration(milliseconds: 400)),
                
                const SizedBox(height: 24),
                
                // Loading Text
                Text(
                  'Preparing your spiritual journey...',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.7),
                  ),
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 1000))
                    .slideY(
                      begin: 0.2,
                      duration: const Duration(milliseconds: 400),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}