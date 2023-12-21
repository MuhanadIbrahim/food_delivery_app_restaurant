part of 'get_meals_bloc.dart';

sealed class GetMealsState extends Equatable {
  const GetMealsState();
  
  @override
  List<Object> get props => [];
}

class MealListInitial extends GetMealsState {
  @override
  List<Object> get props => [];
}

class MealsLoading extends GetMealsState {
  @override
  List<Object> get props => [];
}

class MealsLoadedSuccesfluy extends GetMealsState {
  final List<MyMeals> meals;

  const MealsLoadedSuccesfluy(this.meals);

  @override
  List<Object> get props => [meals];
}

class MealsLoadFailed extends GetMealsState {
  final String error;

  const MealsLoadFailed(this.error);

  @override
  List<Object> get props => [error];
}