import 'package:flutter/material.dart';

class QuranReadingScreen extends StatelessWidget {
  final int surahId;
  final int? initialVerseId;

  const QuranReadingScreen({
    super.key,
    required this.surahId,
    this.initialVerseId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Surah $surahId')),
      body: Center(
        child: Text('Quran Reading Screen - Surah $surahId - Coming Soon'),
      ),
    );
  }
}