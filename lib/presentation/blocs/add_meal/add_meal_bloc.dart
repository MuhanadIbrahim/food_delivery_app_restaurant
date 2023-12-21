import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app_restaurant/domain/meals.dart';
import 'package:food_delivery_app_restaurant/domain/restaurant.dart';

import '../../../data/restaurant_repository.dart';

part 'add_meal_event.dart';
part 'add_meal_state.dart';

class AddMealBloc extends Bloc<MealEvent, MealState> {
  final RestaurantRepository _restaurantRepository;
  AddMealBloc({required RestaurantRepository restaurantRepository})
      : _restaurantRepository = restaurantRepository,
        super(MealsInitial()) {
    on<AddMealEvent>((event, emit) async {
      emit(MealAdding());
      try {
        MyMeals restaurantMeal = await _restaurantRepository.addMeal(
            event.addMeal, event.restaurant);
        emit(MealAddedSuccessfluy(restaurantMeal));
      } catch (error) {
        emit(MealAddFailed(error.toString()));
      }
    });
  }
}
