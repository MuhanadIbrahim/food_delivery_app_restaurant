import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app_restaurant/domain/meals.dart';

import '../../../data/restaurant_repository.dart';
import '../../../domain/restaurant.dart';

part 'get_meals_event.dart';
part 'get_meals_state.dart';

class GetMealsBloc extends Bloc<MealListEvent, GetMealsState> {
  final RestaurantRepository _restaurantRepository;
  GetMealsBloc({required RestaurantRepository restaurantRepository})
      : _restaurantRepository = restaurantRepository,
        super(MealListInitial()) {
    on<GetMealsEvent>((event, emit) async {
      emit(MealsLoading());
      try {
        List<MyMeals> allMeals =
            await _restaurantRepository.getAllMeals(event.restaurant);
        emit(MealsLoadedSuccesfluy(allMeals));
      } catch (error) {
        emit(MealsLoadFailed(error.toString()));
      }
    });
  }
}
