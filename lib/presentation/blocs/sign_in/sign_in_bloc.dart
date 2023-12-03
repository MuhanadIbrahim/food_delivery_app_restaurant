import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app_restaurant/data/restaurant_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final RestaurantRepository _restaurantRepository;
  SignInBloc({required RestaurantRepository restaurantRepository})
      : _restaurantRepository = restaurantRepository,
        super(SignInInitial()) {
    on<SignInRequired>((event, emit) async {
      emit(SignInProcess());

      try {
        var x = await _restaurantRepository.signIn(event.email, event.password);
        if (x) {
          emit(SignInSuccess());
        } else {
          emit(const SignInFailure());
        }
      } catch (e) {
        log(e.toString());
        emit(const SignInFailure());
      }
    });
    on<SignOutRequired>(
      (event, emit) async {
        await _restaurantRepository.logOut();
      },
    );
  }
}
