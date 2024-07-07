import 'package:json_annotation/json_annotation.dart';
part 'location.g.dart';

@JsonSerializable()
class Location {
  final String area;
  final double latitude;
  final double longitude;
  final String fullAddress;

  Location({
    required this.area,
    required this.latitude,
    required this.longitude,
    required this.fullAddress,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
