import 'package:flutter/material.dart';

class EpisodeViewScreen extends StatelessWidget {
  const EpisodeViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Episode View')),
      body: const Center(child: Text('Episode details go here')),
    );
  }
}
