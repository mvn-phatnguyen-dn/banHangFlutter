import 'package:dio/dio.dart';
import 'package:final_flutter_project/network/response/login_response.dart';
import 'package:final_flutter_project/network/response/logout_response.dart';
import 'package:retrofit/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/shared_preferences_service.dart';
import 'response/list_product_response.dart';

part 'api_service.g.dart';

final SharedPreferences prefs = SharedPreferencesService().prefs;

@RestApi(baseUrl: 'http://127.0.0.1:8000/api/v1/user')
abstract class ApiService {
  factory ApiService(Dio dio,
      {String baseUrl = 'http://127.0.0.1:8000/api/v1/user'}) {
    // print(" lấy -------------->");
    // print(prefs.getString('token'));
    dio.options = BaseOptions(
        receiveTimeout: Duration(seconds: 30),
        connectTimeout: Duration(seconds: 30),
        contentType: 'application/json',
        headers: {'Authorization': prefs.getString('token') ?? ""});
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @POST('/login')
  Future<LoginResponse> login(@Body() Map<String, dynamic> body);

  @POST('/logout')
  Future<LogoutResponse> logout();

  @GET('/product')
  Future<ListProductResponse> getListProduct();
}
