import 'package:json_annotation/json_annotation.dart';
import 'package:wizzer_test/core/data/model/image_model.dart';
import 'package:wizzer_test/core/domain/entities/gif_entity.dart';
import 'package:wizzer_test/core/domain/entities/image_entity.dart';

part 'gif_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class GifModel extends GifEntity {
  final ImagesModel? images;
  GifModel(
    String? id,
    this.images,
  ) : super(
          id: id ?? '',
          original: images?.original ?? ImageEntity(height: 0, url: ''),
        );
  factory GifModel.fromJson(Map<String, dynamic> json) => _$GifModelFromJson(json);
  Map<String, dynamic> toJson() => _$GifModelToJson(this);
}
