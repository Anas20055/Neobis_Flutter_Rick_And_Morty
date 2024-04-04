import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty_app/app/domain/entity/enums.dart';
import 'package:rick_and_morty_app/app/domain/entity/results.dart';
import 'package:rick_and_morty_app/app/presentation/bloc/bloc/episode_bloc.dart';
import 'package:rick_and_morty_app/app/presentation/widgets/episode.dart';
import 'package:rick_and_morty_app/core/constants/app_colors.dart';
import 'package:rick_and_morty_app/core/constants/app_svg.dart';

class CharacterInfo extends StatefulWidget {
  final ResultsEntity results;
  const CharacterInfo({super.key, required this.results});

  @override
  State<CharacterInfo> createState() => _CharacterInfoState();
}

class _CharacterInfoState extends State<CharacterInfo> {
  @override
  void initState() {
    BlocProvider.of<EpisodeBloc>(context)
        .add(GetEpisode(widget.results.episode!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 218,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(widget.results.image!),
                      fit: BoxFit.cover),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: 218,
                      child: const ColoredBox(color: AppColors.blueTrans)),
                ),
              ),
              const SizedBox(
                height: 89,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.results.name!,
                      style: const TextStyle(
                        fontSize: 34,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.results.status!,
                      style: theme.bodySmall?.copyWith(
                          color: getColorFromStatus(
                              getStatusFromString(widget.results.status))),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: _buildIformation(
                            'Пол',
                            widget.results.gender!,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: _buildIformation(
                            'Расса',
                            widget.results.species!,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildIformation(
                      'Место рождения',
                      widget.results.origin!.name!,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildIformation(
                      'Местоположение',
                      widget.results.location!.name!,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              const Divider(
                color: AppColors.gradientColor,
                height: 2,
              ),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      'Эпизоды',
                      style: Theme.of(context).textTheme.headlineLarge,
                    )
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<EpisodeBloc, EpisodeState>(
                    builder: (context, state) {
                  if (state is EpisodeLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is EpisodeError) {
                    return const Center(
                      child: Icon(Icons.error),
                    );
                  }
                  if (state is EpisodeDone) {
                    return ListView.separated(
                      padding: const EdgeInsets.only(top: 24),
                      shrinkWrap: true,
                      itemCount: widget.results.episode!.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 24,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              EpisodeItem(
                                episode: state.episodes![index],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox();
                }),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 218),
              Container(
                height: 10,
                color: AppColors.background,
              )
            ],
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 129,
                ),
                CircleAvatar(
                  radius: 81,
                  backgroundColor: AppColors.background,
                  child: CircleAvatar(
                    radius: 73,
                    backgroundImage:
                        CachedNetworkImageProvider(widget.results.image!),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 61,
              left: 16,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(AppSvg.back))),
        ],
      ),
    );
  }

  Widget _buildIformation(String title, String subTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ],
    );
  }
}
