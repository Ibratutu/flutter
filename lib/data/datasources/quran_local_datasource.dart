import 'package:shared_preferences/shared_preferences.dart';

abstract class QuranLocalDataSource {
  // Placeholder methods
}

class QuranLocalDataSourceImpl implements QuranLocalDataSource {
  final SharedPreferences _prefs;

  QuranLocalDataSourceImpl(this._prefs);
}