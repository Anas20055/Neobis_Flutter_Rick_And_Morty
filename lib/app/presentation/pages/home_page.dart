import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty_app/app/domain/entity/character.dart';
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
  late CharacterEntity _currentCharacter;
  List<ResultsEntity> _currentResults = [];
  int _currentPage = 1;
  String _currentSearchString = '';
  bool isListView = true;
  bool isPagination = false;
  String _currentFilterGender = '';
  String _currentFilterStatus = '';
  final controller = ScrollController();
  @override
  void initState() {
    if (_currentResults.isEmpty) {
      BlocProvider.of<CharacterBloc>(context).add(
        GetCharacters(
          Params(
            page: _currentPage,
          ),
          false,
        ),
      );
    }
    super.initState();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        isPagination = true;
        _currentPage++;
        if (_currentPage <= _currentCharacter.info!.pages!) {
          BlocProvider.of<CharacterBloc>(context).add(
            GetCharacters(
              Params(
                page: _currentPage,
                name: _currentSearchString,
                gender: _currentFilterGender,
                status: _currentFilterStatus,
              ),
              false,
            ),
          );
        }
      }
    });
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
              onChanged: _onChanged,
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
                  _currentCharacter = state.characters!;
                  if (isPagination) {
                    _currentResults.addAll(_currentCharacter.results!);
                    isPagination = false;
                  } else {
                    _currentResults = _currentCharacter.results!;
                  }
                  return _currentResults.isNotEmpty
                      ? Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Всего персонажей: ${_currentCharacter.info?.count}',
                                    style: theme.labelSmall,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 14),
                                    child: GestureDetector(
                                      onTap: _onTab,
                                      child: SvgPicture.asset(isListView
                                          ? AppSvg.grid
                                          : AppSvg.list),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                  child:
                                      _customGridAndListView(_currentResults)),
                            ],
                          ),
                        )
                      : const SizedBox();
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

  Widget _customGridAndListView(
    List<ResultsEntity> currentResults,
  ) {
    return isListView
        ? ListView.separated(
            controller: controller,
            padding: const EdgeInsets.only(top: 16),
            itemCount: currentResults.length % 20 == 0
                ? currentResults.length + 1
                : currentResults.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 16,
              );
            },
            itemBuilder: (context, index) {
              if (index < currentResults.length) {
                return ListViewItem(
                  results: currentResults[index],
                  onPostPressed: _onPostPressed,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                mainAxisExtent: 192),
            padding: const EdgeInsets.only(top: 16),
            itemCount: currentResults.length,
            itemBuilder: (context, index) {
              return GridViewItem(
                results: currentResults[index],
                onPostPressed: _onPostPressed,
              );
            });
  }

  void _onPostPressed(ResultsEntity results) {
    Navigator.pushNamed(context, AppRouteNames.characterInfo,
        arguments: results);
  }

  void _onChanged(String value) {
    _currentPage = 1;
    _currentResults = [];
    _currentSearchString = value;
    BlocProvider.of<CharacterBloc>(context).add(
      GetCharacters(
        Params(
          page: _currentPage,
          name: _currentSearchString,
          gender: _currentFilterGender,
          status: _currentFilterStatus,
        ),
        true,
      ),
    );
  }

  void _onFilterPressed() {
    Navigator.pushNamed(
      context,
      AppRouteNames.filters,
    );
  }

  void _onTab() {
    isListView = !isListView;
    setState(() {});
  }
}
