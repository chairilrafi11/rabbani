import 'package:bloc/bloc.dart';
import 'package:chairil/domain/data/user.dart';
import 'package:chairil/domain/repository/province_repository.dart';
import 'package:chairil/domain/repository/user_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/data/city.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading()){
    onGetuser();
  }

  final List<User> listUser = [];
  final List<City> listCity = [];

  onGetuser() async {
    listUser.addAll(await UserRepository().userList());
    emit(HomeSuccess(listUser: listUser));
    listCity.addAll(await ProvinceRepository().cityList());
  }

  onSearch(String keySearch) {
    emit(HomeLoading());
    List<User> listTemp = [];
    listTemp.addAll(listUser);
    listTemp.removeWhere((element){
      if (element.name!.toLowerCase().contains(keySearch.toLowerCase())) {
        return false;
      } else {
        if (element.phoneNumber!.toLowerCase().contains(keySearch.toLowerCase())) {
          return false;
        } else {
          if (element.email!.toLowerCase().contains(keySearch.toLowerCase())) {
            return false;
          } else {
            if (element.address!.toLowerCase().contains(keySearch.toLowerCase())) {
              return false;
            } else {
              return true;
            }
          }
        }
      }
    });
    emit(HomeSuccess(listUser: listTemp));
  }

  onClear(){
    emit(HomeLoading());
    emit(HomeSuccess(listUser: listUser));
  }

  onSortByName () {
    emit(HomeLoading());
    List<User> listTemp = [];
    listTemp.addAll(listUser);
    listTemp.sort((a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));
    emit(HomeSuccess(listUser: listTemp));
  }

  onFilterCity (City city) {
    emit(HomeLoading());
    List<User> listTemp = [];
    listTemp.addAll(listUser);
    listTemp.removeWhere((element) => element.city != city.name);
    emit(HomeSuccess(listUser: listTemp));
  }

}
