// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$$_TagToJson(_$_Tag instance) => <String, dynamic>{
      'action': _$WalletActionEnumMap[instance.action]!,
      'name': instance.name,
      'color': colorToJson(instance.color),
    };

const _$WalletActionEnumMap = {
  WalletAction.add: 'add',
  WalletAction.take: 'take',
};
