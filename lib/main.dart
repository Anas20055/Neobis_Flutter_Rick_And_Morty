import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/app/presentation/pages/home_page.dart';
import 'package:rick_and_morty_app/core/injection/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:rick_and_morty_app/core/constants/app_colors.dart";
part "config/theme/theme.dart";

void main() async {
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CharacterBloc>(),
      child: MaterialApp(
        theme: _theme(),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
