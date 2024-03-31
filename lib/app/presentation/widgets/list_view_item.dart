import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/domain/entity/results.dart';
import 'package:rick_and_morty_app/core/constants/app_colors.dart';

class ListViewItem extends StatelessWidget {
  final ResultsEntity? results;
  const ListViewItem({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: CachedNetworkImageProvider(
              "${results?.image}",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${results?.status}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: results?.status == 'Dead'
                            ? AppColors.red
                            : results?.status == 'Alive'
                                ? AppColors.green
                                : AppColors.blue,
                      ),
                ),
                Text(
                  '${results?.name}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  '${results?.species},${results?.gender}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
