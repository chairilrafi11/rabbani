import 'package:chairil/core/network/dio_client.dart';
import 'package:chairil/core/network/dio_service.dart';
import 'package:chairil/domain/data/user.dart';
import 'package:chairil/domain/data/user_create.dart';

class UserRepository {
  
  Future<List<User>> userList() async {
    var dio = await DioService.checkConnection(tryAgainMethod: userList, isProvince: false);
    DioClient dioClient = DioClient(dio);
    return  await dioClient.userList();
  }

  Future userCreate(UserCreate userCreate) async {
    var dio = await DioService.checkConnection(tryAgainMethod: userCreate, isProvince: false, isLoading: true);
    DioClient dioClient = DioClient(dio);
    return  await dioClient.userCreate(userCreate);
  }

}