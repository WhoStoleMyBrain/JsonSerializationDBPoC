// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardInfo _$CardInfoFromJson(Map<String, dynamic> json) => CardInfo(
      id: json['id'] as String,
      name: json['name'] as String,
      oracleId: json['oracle_id'] as String,
      oracleText: json['oracle_text'] as String?,
      scryfallUri: json['scryfall_uri'] as String,
      imageUris: json['image_uris'] == null
          ? null
          : ImageLinks.fromJson(json['image_uris'] as Map<String, dynamic>),
      prices: json['prices'] == null
          ? null
          : Prices.fromJson(json['prices'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CardInfoToJson(CardInfo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'oracle_id': instance.oracleId,
      'oracle_text': instance.oracleText,
      'scryfall_uri': instance.scryfallUri,
      'image_uris': instance.imageUris?.toJson(),
      'prices': instance.prices?.toJson(),
    };
