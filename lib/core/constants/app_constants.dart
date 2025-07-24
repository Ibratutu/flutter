class AppConstants {
  // App Information
  static const String appName = 'Modern Quran App';
  static const String appVersion = '1.0.0';
  
  // API Endpoints
  static const String quranApiBaseUrl = 'https://api.quran.com/api/v4';
  static const String recitationsApiUrl = 'https://api.quran.com/api/v4/resources/recitations';
  static const String chaptersApiUrl = 'https://api.quran.com/api/v4/chapters';
  static const String versesApiUrl = 'https://api.quran.com/api/v4/verses';
  
  // Storage Keys
  static const String userPrefsKey = 'user_preferences';
  static const String bookmarksKey = 'bookmarks';
  static const String readingProgressKey = 'reading_progress';
  static const String favoriteRecitersKey = 'favorite_reciters';
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'selected_language';
  static const String fontSizeKey = 'font_size';
  static const String autoScrollKey = 'auto_scroll';
  
  // Animations
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);
  static const Duration fastAnimationDuration = Duration(milliseconds: 150);
  static const Duration slowAnimationDuration = Duration(milliseconds: 500);
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double defaultBorderRadius = 12.0;
  static const double smallBorderRadius = 8.0;
  static const double largeBorderRadius = 20.0;
  
  // Font Sizes
  static const double smallFontSize = 12.0;
  static const double mediumFontSize = 16.0;
  static const double largeFontSize = 20.0;
  static const double extraLargeFontSize = 24.0;
  static const double arabicBaseFontSize = 24.0;
  
  // Islamic Constants
  static const int totalSurahs = 114;
  static const int totalVerses = 6236;
  static const int totalJuz = 30;
  static const int totalHizb = 60;
  
  // Prayer Names
  static const List<String> prayerNames = [
    'Fajr',
    'Dhuhr',
    'Asr',
    'Maghrib',
    'Isha'
  ];
  
  // Popular Reciters
  static const List<Map<String, String>> popularReciters = [
    {'id': '1', 'name': 'Mishary Rashid Alafasy', 'country': 'Kuwait'},
    {'id': '2', 'name': 'Abdul Rahman Al-Sudais', 'country': 'Saudi Arabia'},
    {'id': '3', 'name': 'Saad Al Ghamdi', 'country': 'Saudi Arabia'},
    {'id': '4', 'name': 'Maher Al Mueaqly', 'country': 'Saudi Arabia'},
    {'id': '5', 'name': 'Ahmed ibn Ali al-Ajamy', 'country': 'Saudi Arabia'},
    {'id': '6', 'name': 'Hani Ar-Rifai', 'country': 'Saudi Arabia'},
    {'id': '7', 'name': 'Khalid Al Qahtani', 'country': 'Saudi Arabia'},
    {'id': '8', 'name': 'Yasser Al Dosari', 'country': 'Saudi Arabia'},
  ];
  
  // Languages
  static const List<Map<String, String>> supportedLanguages = [
    {'code': 'en', 'name': 'English', 'nativeName': 'English'},
    {'code': 'ar', 'name': 'Arabic', 'nativeName': 'العربية'},
    {'code': 'ur', 'name': 'Urdu', 'nativeName': 'اردو'},
    {'code': 'fr', 'name': 'French', 'nativeName': 'Français'},
    {'code': 'es', 'name': 'Spanish', 'nativeName': 'Español'},
    {'code': 'tr', 'name': 'Turkish', 'nativeName': 'Türkçe'},
    {'code': 'id', 'name': 'Indonesian', 'nativeName': 'Bahasa Indonesia'},
    {'code': 'ms', 'name': 'Malay', 'nativeName': 'Bahasa Melayu'},
  ];
  
  // Content Categories
  static const List<String> contentCategories = [
    'Daily Reminder',
    'Quranic Verses',
    'Hadith',
    'Islamic History',
    'Duas',
    'Islamic Quotes',
    'Prayer Times',
    'Ramadan',
    'Hajj & Umrah',
  ];
  
  // Error Messages
  static const String networkErrorMessage = 'Please check your internet connection';
  static const String genericErrorMessage = 'Something went wrong. Please try again';
  static const String noDataMessage = 'No data available';
  static const String locationPermissionMessage = 'Location permission is required for accurate prayer times';
}

class AppStrings {
  // Navigation
  static const String home = 'Home';
  static const String quran = 'Quran';
  static const String library = 'Library';
  static const String discover = 'Discover';
  static const String profile = 'Profile';
  
  // Quran Section
  static const String surahs = 'Surahs';
  static const String juz = 'Juz';
  static const String bookmarks = 'Bookmarks';
  static const String recentReading = 'Recent Reading';
  static const String continueReading = 'Continue Reading';
  static const String searchQuran = 'Search Quran';
  
  // Library Section
  static const String books = 'Books';
  static const String audiobooks = 'Audiobooks';
  static const String myLibrary = 'My Library';
  static const String searchBooks = 'Search Books';
  
  // Discover Section
  static const String dailyReminder = 'Daily Reminder';
  static const String featuredContent = 'Featured Content';
  static const String trending = 'Trending';
  static const String followingUpdates = 'Following Updates';
  
  // Profile Section
  static const String settings = 'Settings';
  static const String readingStats = 'Reading Statistics';
  static const String following = 'Following';
  static const String achievements = 'Achievements';
  
  // Prayer Times
  static const String prayerTimes = 'Prayer Times';
  static const String nextPrayer = 'Next Prayer';
  static const String qiblaDirection = 'Qibla Direction';
  
  // Authentication
  static const String signIn = 'Sign In';
  static const String signUp = 'Sign Up';
  static const String signOut = 'Sign Out';
  static const String forgotPassword = 'Forgot Password?';
  static const String createAccount = 'Create Account';
  
  // Common
  static const String loading = 'Loading...';
  static const String retry = 'Retry';
  static const String cancel = 'Cancel';
  static const String save = 'Save';
  static const String share = 'Share';
  static const String like = 'Like';
  static const String comment = 'Comment';
  static const String follow = 'Follow';
  static const String unfollow = 'Unfollow';
}