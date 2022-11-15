import 'package:chairil/core/network/dio_client.dart';
import 'package:chairil/core/network/dio_service.dart';
import 'package:chairil/domain/data/product.dart';

class ProductRepository {
  
  Future<List<Product>> productList(String query) async {
    var dio = await DioService.checkConnection(tryAgainMethod: productList);
    DioClient dioClient = DioClient(dio);
    var response = await dioClient.productList(query);
    return response.data!.result ?? [];
  }

}