import 'package:chairil/core/app/app.dart';
import 'package:chairil/domain/data/city.dart';
import 'package:chairil/domain/data/user.dart';
import 'package:chairil/domain/data/user_create.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'dio_client.g.dart';

@RestApi(baseUrl: '')
abstract class DioClient {
  factory DioClient(Dio dio, {String baseUrl}) = _DioClient;

  @GET(Endpoint.user)
  Future<List<User>> userList();

  @POST(Endpoint.user)
  Future userCreate(
    @Body() UserCreate userCreate
  );

  @GET(Endpoint.province)
  Future<List<City>> provinceList();

}
