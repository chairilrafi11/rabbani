part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeEmpty extends HomeState {}

class HomeSuccess extends HomeState {

  final List<User> listUser;

  const HomeSuccess({
    required this.listUser
  });

  @override
  List<Object> get props => [listUser];

}

class HomeError extends HomeState {

  final String message;

  const HomeError({
    required this.message
  });

}
