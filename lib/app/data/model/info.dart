import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty_app/app/domain/entity/info.dart';

part 'info.g.dart';

@JsonSerializable()
class InfoModel extends InfoEntity {
  const InfoModel({
    int? count,
    int? pages,
    String? next,
    String? prev,
  }) : super(
          count,
          pages,
          next,
          prev,
        );

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoModelToJson(this);
}
