import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/app/domain/entity/params.dart';
import 'package:rick_and_morty_app/app/presentation/bloc/character_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<CharacterBloc>(context)
        .add(const GetCharacters(Params(name: 'fsdhfsdkjfsjkfsjkf')));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Myapp'),
      ),
      body: BlocBuilder<CharacterBloc, CharacterState>(
          builder: ((context, state) {
        if (state is CharacterLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CharacterError) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        }
        if (state is CharacterDone) {
          return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Text('${state.characters?.results?[1]}');
              });
        }
        return const Center(
          child: Text('something went wrong'),
        );
      })),
    );
  }
}
