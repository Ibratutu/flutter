import 'package:flutter/material.dart';

class DiscoverContent extends StatelessWidget {
  const DiscoverContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.explore, size: 64),
            SizedBox(height: 16),
            Text('Discover Content - Coming Soon'),
          ],
        ),
      ),
    );
  }
}