import 'package:rick_and_morty_app/app/domain/entity/enums.dart';

class FilterResult {
  final Status filterStatus;
  final Gender filterGender;

  FilterResult({required this.filterStatus, required this.filterGender});
}
