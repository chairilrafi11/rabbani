import 'package:chairil/domain/data/product.dart';

class ResponseApi {
  Data? data;
  bool? success;

  ResponseApi({this.data, this.success});

  ResponseApi.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class Data {
  List<Product>? result;
  int? limit;
  int? totalData;
  int? currentPage;
  int? maxPage;

  Data(
      {this.result,
      this.limit,
      this.totalData,
      this.currentPage,
      this.maxPage});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Product>[];
      json['result'].forEach((v) {
        result!.add(new Product.fromJson(v));
      });
    }
    limit = json['limit'];
    totalData = json['total_data'];
    currentPage = json['current_page'];
    maxPage = json['max_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['limit'] = this.limit;
    data['total_data'] = this.totalData;
    data['current_page'] = this.currentPage;
    data['max_page'] = this.maxPage;
    return data;
  }
}
