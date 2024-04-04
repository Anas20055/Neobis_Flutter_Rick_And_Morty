import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/constants/app_colors.dart';

enum Status { dead, alive, unknown }

Status getStatusFromString(String? statusString) {
  if (statusString == 'Dead') {
    return Status.dead;
  } else if (statusString == 'Alive') {
    return Status.alive;
  } else {
    return Status.unknown;
  }
}

Color getColorFromStatus(Status status) {
  switch (status) {
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
