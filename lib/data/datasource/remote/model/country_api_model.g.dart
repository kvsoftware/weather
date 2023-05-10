// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryApiModel _$CountryApiModelFromJson(Map<String, dynamic> json) =>
    CountryApiModel(
      name: json['name'] == null
          ? null
          : NameApiModel.fromJson(json['name'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CountryApiModelToJson(CountryApiModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

NameApiModel _$NameApiModelFromJson(Map<String, dynamic> json) => NameApiModel(
      common: json['common'] as String?,
    );

Map<String, dynamic> _$NameApiModelToJson(NameApiModel instance) =>
    <String, dynamic>{
      'common': instance.common,
    };
