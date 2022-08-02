
import 'package:get_it/get_it.dart';
import 'package:queritel_practical/services/api.dart';
import 'package:queritel_practical/services/config.dart';

void setupLocator() {
  GetIt locator = GetIt.instance;
  //api services
  locator.registerSingleton(ApiService());

  //sizeConfig
  locator.registerSingleton(ConfigService());
}