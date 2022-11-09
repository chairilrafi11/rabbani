part of 'user_form_cubit.dart';

class UserFormState extends Equatable {

  final City city;

  const UserFormState({
    required this.city
  });

  @override
  List<Object> get props => [
    city
  ];
}

// class UserFormInitial extends UserFormState {}

// class UserFormLoading extends UserFormState {}

// class UserFormSuccess extends UserFormState {


// }
