// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardInfo _$CardInfoFromJson(Map<String, dynamic> json) => CardInfo(
      id: json['id'] as String,
      name: json['name'] as String,
      oracle_id: json['oracle_id'] as String,
      oracle_text: json['oracle_text'] as String?,
    );

Map<String, dynamic> _$CardInfoToJson(CardInfo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'oracle_id': instance.oracle_id,
      'oracle_text': instance.oracle_text,
    };
