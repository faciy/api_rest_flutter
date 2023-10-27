import 'package:apirest/data/network/network_api_services.dart';
import 'package:apirest/res/app_url/app_url.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> loginApi(var data) async {
    dynamic response = _apiService.postApi(data, AppUrl.loginUrl);
    return response;
  }
}
