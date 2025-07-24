import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? photoUrl;
  final bool isEmailVerified;
  final DateTime createdAt;
  final DateTime lastSignInAt;
  final Map<String, dynamic>? preferences;

  const AppUser({
    required this.id,
    required this.email,
    required this.name,
    this.photoUrl,
    required this.isEmailVerified,
    required this.createdAt,
    required this.lastSignInAt,
    this.preferences,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        photoUrl,
        isEmailVerified,
        createdAt,
        lastSignInAt,
        preferences,
      ];

  AppUser copyWith({
    String? id,
    String? email,
    String? name,
    String? photoUrl,
    bool? isEmailVerified,
    DateTime? createdAt,
    DateTime? lastSignInAt,
    Map<String, dynamic>? preferences,
  }) {
    return AppUser(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      createdAt: createdAt ?? this.createdAt,
      lastSignInAt: lastSignInAt ?? this.lastSignInAt,
      preferences: preferences ?? this.preferences,
    );
  }
}