import 'package:flutter/material.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.library_books, size: 64),
            SizedBox(height: 16),
            Text('Library Content - Coming Soon'),
          ],
        ),
      ),
    );
  }
}