import 'package:flutter/material.dart';

class VerseDetailScreen extends StatelessWidget {
  final int verseId;

  const VerseDetailScreen({
    super.key,
    required this.verseId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verse $verseId')),
      body: Center(
        child: Text('Verse Detail Screen - Coming Soon'),
      ),
    );
  }
}
