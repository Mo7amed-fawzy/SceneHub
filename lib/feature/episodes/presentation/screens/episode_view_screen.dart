import 'package:ai_movie_app/feature/episodes/data/models/get_episodes_prams.dart';
import 'package:flutter/material.dart';

class EpisodeViewScreen extends StatelessWidget {
  const EpisodeViewScreen({super.key, required this.params});
  final GetEpisodesParams params;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Episode View')),
      body: const Center(child: Text('Episode details go here')),
    );
  }
}
