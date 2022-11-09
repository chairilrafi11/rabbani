import 'package:bloc/bloc.dart';
import 'package:chairil/core/util/util.dart';
import 'package:chairil/domain/data/city.dart';
import 'package:chairil/domain/data/user_create.dart';
import 'package:chairil/domain/repository/province_repository.dart';
import 'package:chairil/domain/repository/user_repository.dart';
import 'package:chairil/presentation/home/pages/home_page.dart';
import 'package:equatable/equatable.dart';

part 'user_form_state.dart';

class UserFormCubit extends Cubit<UserFormState> {

  UserFormCubit() : super(UserFormState(city: City())){
    onGetCity();
  }

  List<City> listCity = [];

  onGetCity() async {
    listCity.addAll(await ProvinceRepository().cityList());
    CoreFunction.logPrint("tag",listCity.length);
  }

  onChangeCity(City city) {
    emit(UserFormState(city: city));
  }

  onCreateUser (UserCreate userCreate) async {
    await UserRepository().userCreate(userCreate);
    pushAndRemoveUntil(HomePage(), RouterType.material);
  }
  
}
