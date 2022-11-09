import 'package:chairil/core/network/dio_client.dart';
import 'package:chairil/core/network/dio_service.dart';
import 'package:chairil/domain/data/city.dart';

class ProvinceRepository {
  
  Future<List<City>> cityList() async {
    var dio = await DioService.checkConnection(tryAgainMethod: cityList, isProvince: false);
    DioClient dioClient = DioClient(dio);
    return  await dioClient.provinceList();
  }

}