import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'card_info.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class CardInfo {
  //flutter pub run build_runner watch
  CardInfo({
    required this.id,
    required this.name,
    required this.oracle_id,
    required this.oracle_text,
    // required this.text,
    // required this.images,
    // required this.hasTwoSides,
    // required this.price,
    // required this.dateTime,
    // required this.links
  });
  String id;
  String name;
  String oracle_id;
  String? oracle_text;
  // String text;
  // List<String> images;
  // bool hasTwoSides;
  // Map<String, dynamic> price;
  // DateTime dateTime;
  // Map<String, String> links;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory CardInfo.fromJson(Map<String, dynamic> json) =>
      _$CardInfoFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$CardInfoToJson(this);
}
