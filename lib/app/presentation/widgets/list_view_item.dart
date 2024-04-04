import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/domain/entity/enums.dart';
import 'package:rick_and_morty_app/app/domain/entity/results.dart';

class ListViewItem extends StatelessWidget {
  final ResultsEntity? results;
  final void Function(ResultsEntity result)? onPostPressed;
  const ListViewItem({
    super.key,
    required this.results,
    required this.onPostPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: GestureDetector(
        onTap: _onTap,
        child: Row(
          children: [
            CircleAvatar(
              radius: 37,
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
                    style: theme.bodySmall?.copyWith(
                        color: getColorFromStatus(
                            getStatusFromString(results?.status))),
                  ),
                  Text(
                    '${results?.name}',
                    style: theme.bodyLarge,
                  ),
                  Text(
                    '${results?.species},${results?.gender}',
                    style: theme.bodyMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onTap() => onPostPressed?.call(results!);
}
