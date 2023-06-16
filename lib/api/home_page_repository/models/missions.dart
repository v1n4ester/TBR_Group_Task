import 'package:json_annotation/json_annotation.dart';

part 'missions.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Missions {
  final String missionName;
  final String missionId;
  final List<String> manufacturers;
  final List<String> payloadIds;
  final String wikipedia;
  final String website;
  final String twitter;
  final String description;

  const Missions({
    required this.missionName,
    required this.missionId,
    required this.manufacturers,
    required this.payloadIds,
    required this.wikipedia,
    required this.website,
    required this.twitter,
    required this.description,
  });

  factory Missions.fromJson(Map<String, dynamic> json) => _$MissionsFromJson(json);

  Map<String, dynamic> toJson() => _$MissionsToJson(this);
}