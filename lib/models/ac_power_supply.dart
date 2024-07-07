import 'package:json_annotation/json_annotation.dart';

enum ACPowerSupply {
  @JsonValue(0)
  grid,
  @JsonValue(1)
  generator,
  @JsonValue(2)
  ups,
}
