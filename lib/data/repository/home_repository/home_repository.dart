import 'package:apirest/data/models/home/user_list_model.dart';
import 'package:apirest/data/network/network_api_services.dart';
import 'package:apirest/res/app_url/app_url.dart';

class HomeRepository {
  final _apiService = NetworkApiServices();

  Future<UserListModel> userListApi() async {
    dynamic response =
        await _apiService.getApi(AppUrl.userList); // Attendre la réponse
    if (response is Map<String, dynamic>) {
      return UserListModel.fromJson(response); // Désérialiser les données
    } else {
      throw Exception("Réponse inattendue de l'API");
    }
  }
}
