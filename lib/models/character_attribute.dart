import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_attribute.freezed.dart';
part 'character_attribute.g.dart';

@freezed
class CharacterAttribute with _$CharacterAttribute {
  const factory CharacterAttribute({
    required List<CharacterAttributeItem> items,
  }) = _CharacterAttribute;

  factory CharacterAttribute.fromJson(Map<String, dynamic> json) =>
      _$CharacterAttributeFromJson(json);
}

@freezed
class CharacterAttributeItem with _$CharacterAttributeItem {
  const factory CharacterAttributeItem({
    required String name,
  }) = _CharacterAttributeItem;

  factory CharacterAttributeItem.fromJson(Map<String, dynamic> json) =>
      _$CharacterAttributeItemFromJson(json);
}
