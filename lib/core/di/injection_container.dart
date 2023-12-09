import 'package:get/instance_manager.dart';
import 'package:wizzer_test/core/api/giphy_api.dart';
import 'package:wizzer_test/core/di/giphy_dependencies.dart';

class InjectionContainer {
  static void init() async {
    Get.lazyPut<GiphyApi>(() => GiphyApi());
    giphyDependencies();
  }
}
