part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpRequired extends SignUpEvent {
  final MyRestaurant restaurant;
  final String password;

  const SignUpRequired(this.restaurant, this.password);
}
