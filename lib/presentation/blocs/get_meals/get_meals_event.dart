part of 'get_meals_bloc.dart';

sealed class MealListEvent extends Equatable {
  const MealListEvent();

  @override
  List<Object> get props => [];
}

class GetMealsEvent extends MealListEvent {
  final MyRestaurant restaurant;
  const GetMealsEvent(this.restaurant);

  @override
  List<Object> get props => [restaurant];
}
