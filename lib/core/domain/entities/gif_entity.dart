import 'package:wizzer_test/core/domain/entities/image_entity.dart';

class GifEntity {
  final String id;
  final ImageEntity original;
  GifEntity({
    required this.id,
    required this.original,
  });
}
