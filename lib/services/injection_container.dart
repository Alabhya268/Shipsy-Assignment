import 'package:shipsy_assignment/core/api/api_client.dart';
import 'package:shipsy_assignment/services/client_api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shipsy_assignment/utils/constants/paths/api_path.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<RestApiClient>(RestApiClient());
  getIt.registerSingleton<RestAPIRequestPath>(RestAPIRequestPath());
  getIt.registerSingleton<ClientApiService>(ClientApiService());
}
