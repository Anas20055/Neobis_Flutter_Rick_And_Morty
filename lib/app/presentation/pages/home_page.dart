import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty_app/app/domain/entity/params.dart';
import 'package:rick_and_morty_app/app/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/app/presentation/widgets/grid_view_item.dart';
import 'package:rick_and_morty_app/app/presentation/widgets/list_view_item.dart';
import 'package:rick_and_morty_app/app/presentation/widgets/my_textfield.dart';
import 'package:rick_and_morty_app/core/constants/app_colors.dart';
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
    return Scaffold(
      body: BlocBuilder<CharacterBloc, CharacterState>(
          builder: ((context, state) {
        if (state is CharacterLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CharacterError) {
          return const Center(
            child: Icon(Icons.error),
          );
        }
        if (state is CharacterDone) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const MyTextFiled(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Всего персонажей: ${state.characters?.info?.count}',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 14),
                        child: GestureDetector(
                          onTap: () {
                            isListView = !isListView;
                            setState(() {});
                          },
                          child: SvgPicture.asset(AppSvg.grid),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: isListView
                        ? ListView.builder(
                            itemCount: state.characters?.results?.length,
                            itemBuilder: (context, index) {
                              return ListViewItem(
                                  results: state.characters?.results?[index]);
                            })
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16.0,
                              crossAxisSpacing: 16.0,
                            ),
                            padding: const EdgeInsets.only(top: 16),
                            itemCount: state.characters?.results?.length,
                            itemBuilder: (context, index) {
                              return GridViewItem(
                                  results: state.characters?.results?[index]);
                            }),
                  ),
                ],
              ),
            ),
          );
        }
        return const Center(
          child: Text('something went wrong'),
        );
      })),
    );
  }
}
