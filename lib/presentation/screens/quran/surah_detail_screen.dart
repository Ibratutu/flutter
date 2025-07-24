import 'package:flutter/material.dart';

class SurahDetailScreen extends StatelessWidget {
  final int surahId;

  const SurahDetailScreen({
    super.key,
    required this.surahId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Surah $surahId Details')),
      body: Center(
        child: Text('Surah Detail Screen - Coming Soon'),
      ),
    );
  }
}
