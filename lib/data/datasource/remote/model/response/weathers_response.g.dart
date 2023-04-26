// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weathers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeathersResponse _$WeathersResponseFromJson(Map<String, dynamic> json) =>
    WeathersResponse(
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => WeatherApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeathersResponseToJson(WeathersResponse instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
