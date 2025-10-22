import 'package:flutter/material.dart';

class AudiobookPlayerScreen extends StatelessWidget {
  final String bookId;

  const AudiobookPlayerScreen({
    super.key,
    required this.bookId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Audiobook $bookId')),
      body: Center(
        child: Text('Audiobook Player Screen - Coming Soon'),
      ),
    );
  }
}
