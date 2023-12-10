import 'package:json_annotation/json_annotation.dart';
import 'package:wizzer_test/core/domain/entities/image_entity.dart';

part 'image_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ImageModel extends ImageEntity {
  ImageModel(String? height, String? url, bool? isLiked)
      : super(
          height: double.tryParse(height ?? '0') ?? 0,
          url: url ?? '',
          isLiked: isLiked ?? false,
        );
  factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ImagesModel {
  final ImageModel original;

  ImagesModel(this.original);
  factory ImagesModel.fromJson(Map<String, dynamic> json) => _$ImagesModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImagesModelToJson(this);
}
