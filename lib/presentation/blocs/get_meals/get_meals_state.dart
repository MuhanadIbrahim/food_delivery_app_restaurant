part of 'get_meals_bloc.dart';

sealed class GetMealsState extends Equatable {
  const GetMealsState();
  
  @override
  List<Object> get props => [];
}

final class GetMealsInitial extends GetMealsState {}
