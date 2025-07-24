import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/app_constants.dart';

// Events
abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class LoadThemeEvent extends ThemeEvent {}

class ChangeThemeEvent extends ThemeEvent {
  final ThemeMode themeMode;

  const ChangeThemeEvent(this.themeMode);

  @override
  List<Object> get props => [themeMode];
}

class ToggleThemeEvent extends ThemeEvent {}

// States
abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeInitialState extends ThemeState {}

class ThemeLoadingState extends ThemeState {}

class ThemeLoadedState extends ThemeState {
  final ThemeMode themeMode;

  const ThemeLoadedState(this.themeMode);

  @override
  List<Object> get props => [themeMode];
}

class ThemeErrorState extends ThemeState {
  final String message;

  const ThemeErrorState(this.message);

  @override
  List<Object> get props => [message];
}

// BLoC
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SharedPreferences _sharedPreferences;

  ThemeBloc(this._sharedPreferences) : super(ThemeInitialState()) {
    on<LoadThemeEvent>(_onLoadTheme);
    on<ChangeThemeEvent>(_onChangeTheme);
    on<ToggleThemeEvent>(_onToggleTheme);
  }

  Future<void> _onLoadTheme(
    LoadThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    try {
      emit(ThemeLoadingState());
      
      final themeModeString = _sharedPreferences.getString(AppConstants.themeKey);
      ThemeMode themeMode;
      
      if (themeModeString != null) {
        switch (themeModeString) {
          case 'light':
            themeMode = ThemeMode.light;
            break;
          case 'dark':
            themeMode = ThemeMode.dark;
            break;
          case 'system':
          default:
            themeMode = ThemeMode.system;
            break;
        }
      } else {
        themeMode = ThemeMode.system;
      }
      
      emit(ThemeLoadedState(themeMode));
    } catch (e) {
      emit(ThemeErrorState('Failed to load theme: $e'));
    }
  }

  Future<void> _onChangeTheme(
    ChangeThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    try {
      emit(ThemeLoadingState());
      
      String themeModeString;
      switch (event.themeMode) {
        case ThemeMode.light:
          themeModeString = 'light';
          break;
        case ThemeMode.dark:
          themeModeString = 'dark';
          break;
        case ThemeMode.system:
          themeModeString = 'system';
          break;
      }
      
      await _sharedPreferences.setString(AppConstants.themeKey, themeModeString);
      emit(ThemeLoadedState(event.themeMode));
    } catch (e) {
      emit(ThemeErrorState('Failed to change theme: $e'));
    }
  }

  Future<void> _onToggleTheme(
    ToggleThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    try {
      if (state is ThemeLoadedState) {
        final currentState = state as ThemeLoadedState;
        ThemeMode newThemeMode;
        
        switch (currentState.themeMode) {
          case ThemeMode.light:
            newThemeMode = ThemeMode.dark;
            break;
          case ThemeMode.dark:
            newThemeMode = ThemeMode.light;
            break;
          case ThemeMode.system:
            newThemeMode = ThemeMode.dark;
            break;
        }
        
        add(ChangeThemeEvent(newThemeMode));
      }
    } catch (e) {
      emit(ThemeErrorState('Failed to toggle theme: $e'));
    }
  }
}