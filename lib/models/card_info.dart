import 'package:json_annotation/json_annotation.dart';
import 'package:json_serialization_db_poc/models/image_links.dart';
import 'package:json_serialization_db_poc/models/prices.dart';
import 'package:json_serialization_db_poc/models/purchase_uris.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'card_info.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(
    explicitToJson:
        true, // makes subclasses usable in the toJson method. otherwise would get "Instance of..."
    fieldRename:
        FieldRename // renames the fields from the Json to lowerCamelCase variables
            .snake)
class CardInfo {
  //flutter pub run build_runner watch
  CardInfo({
    required this.id,
    required this.name,
    required this.oracleId,
    required this.oracleText,
    required this.scryfallUri,
    required this.imageUris,
    // required this.hasTwoSides,
    required this.prices,
    // required this.dateTime,
    // required this.links
    required this.purchaseUris,
  });
  String id;
  String name;
  String oracleId;
  String? oracleText;
  String scryfallUri;
  ImageLinks? imageUris;

  // bool hasTwoSides; // Can I even add this here?
  Prices? prices;
  // DateTime dateTime; // how to add this here?
  PurchaseUris? purchaseUris;

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
