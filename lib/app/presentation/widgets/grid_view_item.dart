import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/domain/entity/results.dart';
import 'package:rick_and_morty_app/core/constants/app_colors.dart';

class GridViewItem extends StatelessWidget {
  final ResultsEntity? results;
  const GridViewItem({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: CachedNetworkImageProvider(
            "${results?.image}",
          ),
        ),
        const SizedBox(height: 12),
        Text(
          '${results?.status}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: results?.status == 'Dead'
                  ? AppColors.red
                  : results?.status == 'Alive'
                      ? AppColors.green
                      : AppColors.blue),
        ),
        Text(
          '${results?.name}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),
        ),
        Text(
          '${results?.species},${results?.gender}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
