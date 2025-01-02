import 'package:meteor_app/models/auth_model.dart';
import 'package:meteor_app/utils/app_const.dart';
import 'package:retrofit/retrofit.dart';
import 'package:meteor_app/models/base_model.dart';
import 'package:dio/dio.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: AppConst.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("/users/login")
  Future<BaseModel<AuthResponse>> login(@Body() Map<String, dynamic> body);
}
