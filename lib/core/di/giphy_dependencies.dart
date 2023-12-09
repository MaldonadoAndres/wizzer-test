import 'package:get/instance_manager.dart';
import 'package:wizzer_test/core/api/giphy_api.dart';
import 'package:wizzer_test/core/data/repositories/giphy_repository.dart';
import 'package:wizzer_test/core/domain/repositories/i_giphy_repository.dart';
import 'package:wizzer_test/core/domain/use_cases/get_trending_gifs_use_case.dart';

void giphyDependencies() {
  //Repository
  Get.lazyPut<IGiphyRepository>(() => GiphyRepository(api: Get.find<GiphyApi>()));

  //Use Cases
  Get.lazyPut<GetTrendingGifsUseCase>(() => GetTrendingGifsUseCase(repository: Get.find<IGiphyRepository>()));
}
