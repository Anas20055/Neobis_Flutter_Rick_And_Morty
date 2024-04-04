import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty_app/app/domain/entity/params.dart';
import 'package:rick_and_morty_app/app/domain/entity/results.dart';
import 'package:rick_and_morty_app/app/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/app/presentation/widgets/grid_view_item.dart';
import 'package:rick_and_morty_app/app/presentation/widgets/list_view_item.dart';
import 'package:rick_and_morty_app/app/presentation/widgets/my_textfield.dart';
import 'package:rick_and_morty_app/config/routes/routes.dart';
import 'package:rick_and_morty_app/core/constants/app_images.dart';
import 'package:rick_and_morty_app/core/constants/app_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isListView = true;
  @override
  void initState() {
    BlocProvider.of<CharacterBloc>(context).add(const GetCharacters(Params()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            MyTextFiled(
              onFilterPressed: _onFilterPressed,
            ),
            const SizedBox(height: 16),
            BlocBuilder<CharacterBloc, CharacterState>(
              builder: ((context, state) {
                if (state is CharacterLoading) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is CharacterError) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.image1),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 80, vertical: 28),
                          child: Text(
                            'Персонаж с таким именем не найден',
                            textAlign: TextAlign.center,
                            style: theme.labelLarge,
                          ),
                        )
                      ],
                    ),
                  );
                }
                if (state is CharacterDone) {
                  return Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Всего персонажей: ${state.characters?.info?.count}',
                              style: theme.labelSmall,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 14),
                              child: GestureDetector(
                                onTap: () {
                                  isListView = !isListView;
                                  setState(() {});
                                },
                                child: SvgPicture.asset(
                                    isListView ? AppSvg.grid : AppSvg.list),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: isListView
                              ? ListView.separated(
                                  itemCount: state.characters!.results!.length,
                                  separatorBuilder: (context, index) {
                                    return SizedBox();
                                  },
                                  itemBuilder: (context, index) {
                                    return ListViewItem(
                                      results:
                                          state.characters?.results?[index],
                                      onPostPressed: _onPostPressed,
                                    );
                                  })
                              : GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 16.0,
                                          crossAxisSpacing: 16.0,
                                          mainAxisExtent: 192),
                                  padding: const EdgeInsets.only(top: 16),
                                  itemCount: state.characters?.results?.length,
                                  itemBuilder: (context, index) {
                                    return GridViewItem(
                                      results:
                                          state.characters?.results?[index],
                                      onPostPressed: _onPostPressed,
                                    );
                                  }),
                        ),
                      ],
                    ),
                  );
                }
                return const Center(
                  child: Text('something went wrong'),
                );
              }),
            ),
          ]),
        ),
      ),
    );
  }

  void _onPostPressed(ResultsEntity results) {
    Navigator.pushNamed(context, AppRouteNames.characterInfo,
        arguments: results);
  }

  void _onFilterPressed() {
    Navigator.pushNamed(
      context,
      AppRouteNames.filters,
    );
  }
}
