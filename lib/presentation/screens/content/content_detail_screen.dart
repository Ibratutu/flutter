import 'package:flutter/material.dart';

class ContentDetailScreen extends StatelessWidget {
  final String contentId;

  const ContentDetailScreen({
    super.key,
    required this.contentId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Content $contentId')),
      body: Center(
        child: Text('Content Detail Screen - Coming Soon'),
      ),
    );
  }
}
