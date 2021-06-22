








import 'package:get/instance_manager.dart';
import 'package:justmarryapp/shared/weather_controller.dart';


class WeatherBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeatherController(city: 'Kuala Lumpur'));
  }
}