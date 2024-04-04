import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/domain/entity/enums.dart';
import 'package:rick_and_morty_app/app/domain/entity/results.dart';

class GridViewItem extends StatelessWidget {
  final ResultsEntity? results;
  final void Function(ResultsEntity result)? onPostPressed;
  const GridViewItem({
    super.key,
    required this.results,
    required this.onPostPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Column(
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
                color:
                    getColorFromStatus(getStatusFromString(results?.status))),
          ),
          Text(
            '${results?.name}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:
                Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),
          ),
          Text(
            '${results?.species},${results?.gender}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  void _onTap() => onPostPressed?.call(results!);
}
