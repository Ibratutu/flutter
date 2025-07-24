import 'package:equatable/equatable.dart';

class Verse extends Equatable {
  final int id;
  final int surahId;
  final int verseNumber;
  final String textArabic;
  final String textUthmani;
  final String textImlaei;
  final List<Translation> translations;
  final List<Tafseer> tafseers;
  final String audioUrl;
  final int juzNumber;
  final int hizbNumber;
  final int rubElHizbNumber;
  final int sajda;
  final List<String> topics;
  final bool isBookmarked;

  const Verse({
    required this.id,
    required this.surahId,
    required this.verseNumber,
    required this.textArabic,
    required this.textUthmani,
    required this.textImlaei,
    required this.translations,
    required this.tafseers,
    required this.audioUrl,
    required this.juzNumber,
    required this.hizbNumber,
    required this.rubElHizbNumber,
    required this.sajda,
    required this.topics,
    this.isBookmarked = false,
  });

  @override
  List<Object?> get props => [
        id,
        surahId,
        verseNumber,
        textArabic,
        textUthmani,
        textImlaei,
        translations,
        tafseers,
        audioUrl,
        juzNumber,
        hizbNumber,
        rubElHizbNumber,
        sajda,
        topics,
        isBookmarked,
      ];

  Verse copyWith({
    int? id,
    int? surahId,
    int? verseNumber,
    String? textArabic,
    String? textUthmani,
    String? textImlaei,
    List<Translation>? translations,
    List<Tafseer>? tafseers,
    String? audioUrl,
    int? juzNumber,
    int? hizbNumber,
    int? rubElHizbNumber,
    int? sajda,
    List<String>? topics,
    bool? isBookmarked,
  }) {
    return Verse(
      id: id ?? this.id,
      surahId: surahId ?? this.surahId,
      verseNumber: verseNumber ?? this.verseNumber,
      textArabic: textArabic ?? this.textArabic,
      textUthmani: textUthmani ?? this.textUthmani,
      textImlaei: textImlaei ?? this.textImlaei,
      translations: translations ?? this.translations,
      tafseers: tafseers ?? this.tafseers,
      audioUrl: audioUrl ?? this.audioUrl,
      juzNumber: juzNumber ?? this.juzNumber,
      hizbNumber: hizbNumber ?? this.hizbNumber,
      rubElHizbNumber: rubElHizbNumber ?? this.rubElHizbNumber,
      sajda: sajda ?? this.sajda,
      topics: topics ?? this.topics,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }
}

class Translation extends Equatable {
  final int id;
  final String language;
  final String text;
  final String authorName;
  final String resourceName;

  const Translation({
    required this.id,
    required this.language,
    required this.text,
    required this.authorName,
    required this.resourceName,
  });

  @override
  List<Object?> get props => [id, language, text, authorName, resourceName];
}

class Tafseer extends Equatable {
  final int id;
  final String language;
  final String text;
  final String authorName;
  final String resourceName;

  const Tafseer({
    required this.id,
    required this.language,
    required this.text,
    required this.authorName,
    required this.resourceName,
  });

  @override
  List<Object?> get props => [id, language, text, authorName, resourceName];
}