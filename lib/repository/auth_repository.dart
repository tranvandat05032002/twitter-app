import 'package:meteor_app/models/auth_model.dart';
import 'package:meteor_app/models/base_model.dart';
import 'package:meteor_app/remote/api_service.dart';

class AuthRepository {
  final ApiService _apiService;

  AuthRepository(this._apiService);

  Future<BaseModel<AuthResponse>> login(String email, String password) async {
    return _apiService.login({"email": email, "password": password});
  }
}
