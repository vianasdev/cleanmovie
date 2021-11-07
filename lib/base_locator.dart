import 'package:cleanmovie/network_services/base_dio.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<Dio>(BaseDio().mDio());
}

Dio get gDio => locator<Dio>();
