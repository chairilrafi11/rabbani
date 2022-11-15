import 'package:chairil/core/app/app.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../domain/data/response_api.dart';

part 'dio_client.g.dart';

@RestApi(baseUrl: '')
abstract class DioClient {
  factory DioClient(Dio dio, {String baseUrl}) = _DioClient;

  @GET(Endpoint.product)
  Future<ResponseApi> productList(
    @Query("q") String quesry
  );

}
