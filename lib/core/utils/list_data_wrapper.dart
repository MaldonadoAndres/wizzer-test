import 'package:json_annotation/json_annotation.dart';

part 'list_data_wrapper.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ListDataWrapper<T> {
  final List<T> data;

  ListDataWrapper(this.data);
  factory ListDataWrapper.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ListDataWrapperFromJson(
        json,
        (object) => fromJsonT(object),
      );
  Map<String, dynamic> toJson(T Function(Object? json) toJsonTo) => _$ListDataWrapperToJson(
        this,
        (value) => toJsonTo(value),
      );
}
