import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app_restaurant/data/restaurant_repository.dart';
import 'package:food_delivery_app_restaurant/domain/restaurant.dart';

import 'my_restaurant_bloc_bloc.dart';

part 'my_restaurant_bloc_event.dart';
part 'my_restaurant_bloc_state.dart';

class MyRestaurantBlocBloc
    extends Bloc<MyRestaurantBlocEvent, MyRestaurantBlocState> {
  final RestaurantRepository _restaurantRepository;
  MyRestaurantBlocBloc({required RestaurantRepository myRestaurantRepository})
      : _restaurantRepository = myRestaurantRepository,
        super(const MyRestaurantBlocState.loading()) {
    on<GetMyRestaurant>((event, emit) async {
      try {
        MyRestaurant myRestaurant =
            await _restaurantRepository.getMyRestaurant(event.myRestaurantId);
        emit(MyRestaurantBlocState.success(myRestaurant));
      } catch (e) {
        log(e.toString());
        emit(const MyRestaurantBlocState.failure());
      }
    });
  }
}
