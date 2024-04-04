import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/domain/entity/results.dart';
import 'package:rick_and_morty_app/app/presentation/pages/character_info.dart';
import 'package:rick_and_morty_app/app/presentation/pages/filters.dart';
import 'package:rick_and_morty_app/app/presentation/pages/home_page.dart';

abstract class AppRouteNames {
  static const characterInfo = '/characterInfo';
  static const homePage = '/';
  static const filters = '/filters';
}

abstract class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.homePage:
        return _materialRoute(const HomePage());

      case AppRouteNames.characterInfo:
        return _materialRoute(
            CharacterInfo(results: settings.arguments as ResultsEntity));

      case AppRouteNames.filters:
        return _materialRoute(const Filters());

      default:
        return _materialRoute(const HomePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
