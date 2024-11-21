// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sikom_gateway.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SikomGatewayImpl _$$SikomGatewayImplFromJson(Map<String, dynamic> json) =>
    _$SikomGatewayImpl(
      id: (json['GatewayId'] as num).toInt(),
      controller: SikomGatewayController.fromJson(
          json['Controller'] as Map<String, dynamic>),
      properties: SikomGatewayProperties.fromJson(
          json['Properties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SikomGatewayImplToJson(_$SikomGatewayImpl instance) =>
    <String, dynamic>{
      'GatewayId': instance.id,
      'Controller': instance.controller.toJson(),
      'Properties': instance.properties.toJson(),
    };

_$SikomGatewayControllerImpl _$$SikomGatewayControllerImplFromJson(
        Map<String, dynamic> json) =>
    _$SikomGatewayControllerImpl(
      properties: SikomGatewayControllerProperties.fromJson(
          json['Properties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SikomGatewayControllerImplToJson(
        _$SikomGatewayControllerImpl instance) =>
    <String, dynamic>{
      'Properties': instance.properties.toJson(),
    };

_$SikomGatewayPropertiesImpl _$$SikomGatewayPropertiesImplFromJson(
        Map<String, dynamic> json) =>
    _$SikomGatewayPropertiesImpl(
      gatewayType:
          SikomProperty.fromJson(json['gateway_type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SikomGatewayPropertiesImplToJson(
        _$SikomGatewayPropertiesImpl instance) =>
    <String, dynamic>{
      'gateway_type': instance.gatewayType.toJson(),
    };

_$SikomGatewayControllerPropertiesImpl
    _$$SikomGatewayControllerPropertiesImplFromJson(
            Map<String, dynamic> json) =>
        _$SikomGatewayControllerPropertiesImpl(
          bestEffortName: SikomProperty.fromJson(
              json['best_effort_name'] as Map<String, dynamic>),
          userDefinedName: json['user_defined_name'] == null
              ? null
              : SikomProperty.fromJson(
                  json['user_defined_name'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$SikomGatewayControllerPropertiesImplToJson(
        _$SikomGatewayControllerPropertiesImpl instance) =>
    <String, dynamic>{
      'best_effort_name': instance.bestEffortName.toJson(),
      'user_defined_name': instance.userDefinedName?.toJson(),
    };
