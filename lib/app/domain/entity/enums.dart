import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/constants/app_colors.dart';

enum Status { dead, alive, unknown, empty }

enum Gender { female, male, genderless, empty }

Status getStatusFromString(String? statusString) {
  if (statusString == 'Dead') {
    return Status.dead;
  } else if (statusString == 'Alive') {
    return Status.alive;
  } else {
    return Status.unknown;
  }
}

extension StatusExtension on Status {
  Color get getColorFromStatus {
    switch (this) {
      case Status.dead:
        return AppColors.red;
      case Status.alive:
        return AppColors.green;
      case Status.unknown:
        return AppColors.blue;
      default:
        return AppColors.blue; // Handle default case
    }
  }

  String get getString {
    switch (this) {
      case Status.dead:
        return 'dead';
      case Status.alive:
        return 'alive';
      case Status.unknown:
        return 'unknown';
      default:
        return ''; // Handle default case
    }
  }

  String get getStringRu {
    switch (this) {
      case Status.dead:
        return 'Мертвый';
      case Status.alive:
        return 'Живой';
      case Status.unknown:
        return 'Неизвестно';
      default:
        return ''; // Handle default case
    }
  }
}

extension GenderExtension on Gender {
  String get getString {
    switch (this) {
      case Gender.female:
        return 'female';
      case Gender.male:
        return 'male';
      case Gender.genderless:
        return 'genderless';
      default:
        return ''; // Handle default case
    }
  }

  String get getStringRu {
    switch (this) {
      case Gender.female:
        return 'Женский';
      case Gender.male:
        return 'Мужской';
      case Gender.genderless:
        return 'Бесполый';
      default:
        return ''; // Handle default case
    }
  }
}
