import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app_restaurant/data/restaurant_repository.dart';
import 'package:food_delivery_app_restaurant/domain/restaurant.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final RestaurantRepository _restaurantRepository;
  SignUpBloc({required RestaurantRepository restaurantRepository})
      : _restaurantRepository = restaurantRepository,
        super(SignUpInitial()) {
    on<SignUpRequired>((event, emit) async {
      emit(SignUpProcess());
      try {
        MyRestaurant restaurant = await _restaurantRepository.signUp(
            event.restaurant, event.password);
        await _restaurantRepository.setRestaurantData(restaurant);
        emit(SignUpSuccess());
      } catch (e) {
        log(e.toString());
        emit(SignUpFailure());
      }
    });
  }
}
