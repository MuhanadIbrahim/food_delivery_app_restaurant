part of 'add_meal_bloc.dart';

sealed class MealEvent extends Equatable {
  const MealEvent();

  @override
  List<Object> get props => [];
}

class AddMealEvent extends MealEvent {
  final MyMeals addMeal;
  final MyRestaurant restaurant;
  const AddMealEvent({
    required this.addMeal,
    required this.restaurant,
  });

  @override
  List<Object> get props => [addMeal, restaurant];
}


