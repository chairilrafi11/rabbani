import 'package:bloc/bloc.dart';
import 'package:chairil/domain/data/product.dart';
import 'package:chairil/domain/repository/product_repository.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading()){
    onGetProduct();
  }

  onGetProduct() async {
    emit(HomeSuccess(listProduct: await ProductRepository().productList('')));
  }

  onSearch(String keySearch) async {
    emit(HomeLoading());
    emit(HomeSuccess(listProduct: await ProductRepository().productList(keySearch)));
  }

  onClear(){
    emit(HomeLoading());
    onGetProduct();
  }

}
