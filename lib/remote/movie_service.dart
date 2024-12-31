import 'package:meteor_app/models/page_response.dart';
import 'package:meteor_app/utils/app_const.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'movie_service.g.dart';

@RestApi(baseUrl: AppConst.baseUrl)
abstract class MovieService {
  factory MovieService(Dio dio, {String baseUrl}) = _MovieService;

  @GET("/movie/top_rated")
  Future<PageResponse> getTopRatedList(
    @Query("page") int page,
  );
}