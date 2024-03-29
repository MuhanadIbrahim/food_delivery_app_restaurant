part of 'add_meal_bloc.dart';

sealed class MealState extends Equatable {
  const MealState();

  @override
  List<Object> get props => [];
}

class MealsInitial extends MealState {
  @override
  List<Object> get props => [];
}

class MealAdding extends MealState {
  @override
  List<Object> get props => [];
}

class MealAddedSuccessfluy extends MealState {
  var addMeal;

  MealAddedSuccessfluy(this.addMeal);
  @override
  List<Object> get props => [addMeal];
}

class MealAddFailed extends MealState {
  final String error;

  const MealAddFailed(this.error);

  @override
  List<Object> get props => [error];
}
