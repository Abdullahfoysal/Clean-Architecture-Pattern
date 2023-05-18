import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@JsonSerializable()
class Links {
  dynamic url;
  String? label;
  bool? active;

  Links();
  factory Links.fromJson(Map<String, dynamic> json) {
    return _$LinksFromJson(json);
  }
  toJson() => _$LinksToJson(this);
}
