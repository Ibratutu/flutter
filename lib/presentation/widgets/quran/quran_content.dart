import 'package:flutter/material.dart';

class QuranContent extends StatelessWidget {
  const QuranContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu_book, size: 64),
            SizedBox(height: 16),
            Text('Quran Content - Coming Soon'),
          ],
        ),
      ),
    );
  }
}