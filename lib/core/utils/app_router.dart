import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/bloc/auth/auth_bloc.dart';
import '../../presentation/screens/splash_screen.dart';
import '../../presentation/screens/onboarding/onboarding_screen.dart';
import '../../presentation/screens/auth/sign_in_screen.dart';
import '../../presentation/screens/auth/sign_up_screen.dart';
import '../../presentation/screens/home/main_navigation_screen.dart';
import '../../presentation/screens/quran/quran_reading_screen.dart';
import '../../presentation/screens/quran/surah_detail_screen.dart';
import '../../presentation/screens/quran/verse_detail_screen.dart';
import '../../presentation/screens/library/book_detail_screen.dart';
import '../../presentation/screens/library/audiobook_player_screen.dart';
import '../../presentation/screens/content/content_detail_screen.dart';

import '../../presentation/screens/profile/settings_screen.dart';
import '../../presentation/screens/prayer/prayer_times_screen.dart';
import '../../presentation/screens/prayer/qibla_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final authState = context.read<AuthBloc>().state;
      final location = state.matchedLocation;
      
      // If user is on splash screen, let it handle the navigation
      if (location == '/splash') {
        return null;
      }
      
      // If user is not authenticated and trying to access protected routes
      if (authState is AuthUnauthenticated) {
        if (location.startsWith('/home') ||
            location.startsWith('/quran') ||
            location.startsWith('/library') ||
            location.startsWith('/content') ||
            location.startsWith('/profile') ||
            location.startsWith('/prayer')) {
          return '/onboarding';
        }
      }
      
      // If user is authenticated and trying to access auth screens
      if (authState is AuthAuthenticated) {
        if (location == '/onboarding' ||
            location == '/sign-in' ||
            location == '/sign-up') {
          return '/home';
        }
      }
      
      return null;
    },
    routes: [
      // Splash Screen
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      
      // Onboarding
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      
      // Authentication Routes
      GoRoute(
        path: '/sign-in',
        name: 'signIn',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/sign-up',
        name: 'signUp',
        builder: (context, state) => const SignUpScreen(),
      ),
      
      // Main App Routes
      ShellRoute(
        builder: (context, state, child) {
          return MainNavigationScreen(child: child);
        },
        routes: [
          // Home
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => Container(), // Home content is handled by MainNavigationScreen
          ),
          
          // Quran Routes
          GoRoute(
            path: '/quran',
            name: 'quran',
            builder: (context, state) => Container(), // Quran content is handled by MainNavigationScreen
            routes: [
              GoRoute(
                path: '/reading/:surahId',
                name: 'quranReading',
                                 builder: (context, state) {
                   final surahId = int.parse(state.pathParameters['surahId']!);
                   final verseId = state.uri.queryParameters['verseId'];
                   return QuranReadingScreen(
                     surahId: surahId,
                     initialVerseId: verseId != null ? int.parse(verseId) : null,
                   );
                 },
              ),
              GoRoute(
                path: '/surah/:surahId',
                name: 'surahDetail',
                builder: (context, state) {
                  final surahId = int.parse(state.pathParameters['surahId']!);
                  return SurahDetailScreen(surahId: surahId);
                },
              ),
              GoRoute(
                path: '/verse/:verseId',
                name: 'verseDetail',
                builder: (context, state) {
                  final verseId = int.parse(state.pathParameters['verseId']!);
                  return VerseDetailScreen(verseId: verseId);
                },
              ),
            ],
          ),
          
          // Library Routes
          GoRoute(
            path: '/library',
            name: 'library',
            builder: (context, state) => Container(), // Library content is handled by MainNavigationScreen
            routes: [
              GoRoute(
                path: '/book/:bookId',
                name: 'bookDetail',
                builder: (context, state) {
                  final bookId = state.pathParameters['bookId']!;
                  return BookDetailScreen(bookId: bookId);
                },
              ),
              GoRoute(
                path: '/audiobook/:bookId',
                name: 'audiobookPlayer',
                builder: (context, state) {
                  final bookId = state.pathParameters['bookId']!;
                  return AudiobookPlayerScreen(bookId: bookId);
                },
              ),
            ],
          ),
          
          // Discover Routes
          GoRoute(
            path: '/discover',
            name: 'discover',
            builder: (context, state) => Container(), // Discover content is handled by MainNavigationScreen
            routes: [
              GoRoute(
                path: '/content/:contentId',
                name: 'contentDetail',
                builder: (context, state) {
                  final contentId = state.pathParameters['contentId']!;
                  return ContentDetailScreen(contentId: contentId);
                },
              ),
            ],
          ),
          
          // Profile Routes
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => Container(), // Profile content is handled by MainNavigationScreen
            routes: [
              GoRoute(
                path: '/settings',
                name: 'settings',
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
      
      // Additional Routes (outside bottom navigation)
      GoRoute(
        path: '/prayer-times',
        name: 'prayerTimes',
        builder: (context, state) => const PrayerTimesScreen(),
      ),
      GoRoute(
        path: '/qibla',
        name: 'qibla',
        builder: (context, state) => const QiblaScreen(),
      ),
    ],
    
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Page not found',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'The page you are looking for does not exist.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go('/home'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
}

// Route Paths Class for type-safe navigation
class RoutePaths {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String home = '/home';
  static const String quran = '/quran';
  static const String library = '/library';
  static const String discover = '/discover';
  static const String profile = '/profile';
  static const String settings = '/profile/settings';
  static const String prayerTimes = '/prayer-times';
  static const String qibla = '/qibla';
  
  // Dynamic routes
  static String quranReading(int surahId, {int? verseId}) {
    final path = '/quran/reading/$surahId';
    return verseId != null ? '$path?verseId=$verseId' : path;
  }
  
  static String surahDetail(int surahId) => '/quran/surah/$surahId';
  static String verseDetail(int verseId) => '/quran/verse/$verseId';
  static String bookDetail(String bookId) => '/library/book/$bookId';
  static String audiobookPlayer(String bookId) => '/library/audiobook/$bookId';
  static String contentDetail(String contentId) => '/discover/content/$contentId';
}

// Navigation Extensions
extension GoRouterExtension on GoRouter {
  void pushAndClearStack(String path) {
    while (canPop()) {
      pop();
    }
    pushReplacement(path);
  }
}

extension BuildContextExtension on BuildContext {
  void pushAndClearStack(String path) {
    GoRouter.of(this).pushAndClearStack(path);
  }
}