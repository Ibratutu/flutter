import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:dio/dio.dart';
import 'package:just_audio/just_audio.dart';

// Data Sources
import '../../data/datasources/quran_remote_datasource.dart';
import '../../data/datasources/quran_local_datasource.dart';
import '../../data/datasources/auth_datasource.dart';
import '../../data/datasources/prayer_datasource.dart';
import '../../data/datasources/content_datasource.dart';
import '../../data/datasources/library_datasource.dart';

// Repositories
import '../../data/repositories/quran_repository_impl.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/repositories/prayer_repository_impl.dart';
import '../../data/repositories/content_repository_impl.dart';
import '../../data/repositories/library_repository_impl.dart';

// Domain Repositories
import '../../domain/repositories/quran_repository.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/prayer_repository.dart';
import '../../domain/repositories/content_repository.dart';
import '../../domain/repositories/library_repository.dart';

// Use Cases
import '../../domain/usecases/quran/get_surahs.dart';
import '../../domain/usecases/quran/get_verses.dart';
import '../../domain/usecases/quran/search_quran.dart';
import '../../domain/usecases/quran/bookmark_verse.dart';
import '../../domain/usecases/auth/sign_in_with_email.dart';
import '../../domain/usecases/auth/sign_up_with_email.dart';
import '../../domain/usecases/auth/sign_in_with_google.dart';
import '../../domain/usecases/auth/sign_out.dart';
import '../../domain/usecases/prayer/get_prayer_times.dart';
import '../../domain/usecases/content/get_daily_reminder.dart';
import '../../domain/usecases/content/get_featured_content.dart';
import '../../domain/usecases/library/get_books.dart';
import '../../domain/usecases/library/search_books.dart';

// BLoCs
import '../../presentation/bloc/theme/theme_bloc.dart';
import '../../presentation/bloc/auth/auth_bloc.dart';
import '../../presentation/bloc/quran/quran_bloc.dart';
import '../../presentation/bloc/prayer/prayer_bloc.dart';
import '../../presentation/bloc/content/content_bloc.dart';
import '../../presentation/bloc/library/library_bloc.dart';

// Services
import '../utils/audio_service.dart';
import '../utils/location_service.dart';
import '../utils/notification_service.dart';
import '../utils/cache_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // External dependencies
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);
  getIt.registerLazySingleton(() => FirebaseStorage.instance);
  
  // HTTP Client
  getIt.registerLazySingleton(() => Dio());
  
  // Audio Player
  getIt.registerLazySingleton(() => AudioPlayer());
  
  // Services
  getIt.registerLazySingleton<AudioService>(
    () => AudioService(getIt()),
  );
  
  getIt.registerLazySingleton<LocationService>(
    () => LocationService(),
  );
  
  getIt.registerLazySingleton<NotificationService>(
    () => NotificationService(),
  );
  
  getIt.registerLazySingleton<CacheService>(
    () => CacheService(getIt()),
  );
  
  // Data Sources
  getIt.registerLazySingleton<QuranRemoteDataSource>(
    () => QuranRemoteDataSourceImpl(getIt()),
  );
  
  getIt.registerLazySingleton<QuranLocalDataSource>(
    () => QuranLocalDataSourceImpl(getIt()),
  );
  
  getIt.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(getIt(), getIt()),
  );
  
  getIt.registerLazySingleton<PrayerDataSource>(
    () => PrayerDataSourceImpl(getIt()),
  );
  
  getIt.registerLazySingleton<ContentDataSource>(
    () => ContentDataSourceImpl(getIt(), getIt()),
  );
  
  getIt.registerLazySingleton<LibraryDataSource>(
    () => LibraryDataSourceImpl(getIt(), getIt()),
  );
  
  // Repositories
  getIt.registerLazySingleton<QuranRepository>(
    () => QuranRepositoryImpl(getIt(), getIt()),
  );
  
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt()),
  );
  
  getIt.registerLazySingleton<PrayerRepository>(
    () => PrayerRepositoryImpl(getIt()),
  );
  
  getIt.registerLazySingleton<ContentRepository>(
    () => ContentRepositoryImpl(getIt()),
  );
  
  getIt.registerLazySingleton<LibraryRepository>(
    () => LibraryRepositoryImpl(getIt()),
  );
  
  // Use Cases - Quran
  getIt.registerLazySingleton(() => GetSurahs(getIt()));
  getIt.registerLazySingleton(() => GetVerses(getIt()));
  getIt.registerLazySingleton(() => SearchQuran(getIt()));
  getIt.registerLazySingleton(() => BookmarkVerse(getIt()));
  
  // Use Cases - Auth
  getIt.registerLazySingleton(() => SignInWithEmail(getIt()));
  getIt.registerLazySingleton(() => SignUpWithEmail(getIt()));
  getIt.registerLazySingleton(() => SignInWithGoogle(getIt()));
  getIt.registerLazySingleton(() => SignOut(getIt()));
  
  // Use Cases - Prayer
  getIt.registerLazySingleton(() => GetPrayerTimes(getIt()));
  
  // Use Cases - Content
  getIt.registerLazySingleton(() => GetDailyReminder(getIt()));
  getIt.registerLazySingleton(() => GetFeaturedContent(getIt()));
  
  // Use Cases - Library
  getIt.registerLazySingleton(() => GetBooks(getIt()));
  getIt.registerLazySingleton(() => SearchBooks(getIt()));
  
  // BLoCs
  getIt.registerFactory(() => ThemeBloc(getIt()));
  getIt.registerFactory(() => AuthBloc(
    getIt(),
    getIt(),
    getIt(),
    getIt(),
  ));
  getIt.registerFactory(() => QuranBloc(
    getIt(),
    getIt(),
    getIt(),
    getIt(),
  ));
  getIt.registerFactory(() => PrayerBloc(getIt()));
  getIt.registerFactory(() => ContentBloc(
    getIt(),
    getIt(),
  ));
  getIt.registerFactory(() => LibraryBloc(
    getIt(),
    getIt(),
  ));
}