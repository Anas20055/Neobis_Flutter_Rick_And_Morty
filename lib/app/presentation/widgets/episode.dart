import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/domain/entity/episode.dart';

class EpisodeItem extends StatefulWidget {
  final EpisodeEntity episode;
  const EpisodeItem({
    super.key,
    required this.episode,
  });

  @override
  State<EpisodeItem> createState() => _EpisodeItemState();
}

class _EpisodeItemState extends State<EpisodeItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.episode.episode,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          widget.episode.name,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          widget.episode.air_date,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
