import 'package:equatable/equatable.dart';

class Surah extends Equatable {
  final int id;
  final String nameArabic;
  final String nameEnglish;
  final String nameTranslated;
  final int versesCount;
  final int revelationOrder;
  final String revelationPlace;
  final List<String> pages;
  final bool isMeccan;
  final String audioUrl;
  final String description;

  const Surah({
    required this.id,
    required this.nameArabic,
    required this.nameEnglish,
    required this.nameTranslated,
    required this.versesCount,
    required this.revelationOrder,
    required this.revelationPlace,
    required this.pages,
    required this.isMeccan,
    required this.audioUrl,
    required this.description,
  });

  @override
  List<Object?> get props => [
        id,
        nameArabic,
        nameEnglish,
        nameTranslated,
        versesCount,
        revelationOrder,
        revelationPlace,
        pages,
        isMeccan,
        audioUrl,
        description,
      ];

  Surah copyWith({
    int? id,
    String? nameArabic,
    String? nameEnglish,
    String? nameTranslated,
    int? versesCount,
    int? revelationOrder,
    String? revelationPlace,
    List<String>? pages,
    bool? isMeccan,
    String? audioUrl,
    String? description,
  }) {
    return Surah(
      id: id ?? this.id,
      nameArabic: nameArabic ?? this.nameArabic,
      nameEnglish: nameEnglish ?? this.nameEnglish,
      nameTranslated: nameTranslated ?? this.nameTranslated,
      versesCount: versesCount ?? this.versesCount,
      revelationOrder: revelationOrder ?? this.revelationOrder,
      revelationPlace: revelationPlace ?? this.revelationPlace,
      pages: pages ?? this.pages,
      isMeccan: isMeccan ?? this.isMeccan,
      audioUrl: audioUrl ?? this.audioUrl,
      description: description ?? this.description,
    );
  }
}