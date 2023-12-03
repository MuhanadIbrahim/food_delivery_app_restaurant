part of 'my_restaurant_bloc_bloc.dart';

sealed class MyRestaurantBlocState extends Equatable {
  const MyRestaurantBlocState();
  
  @override
  List<Object> get props => [];
}

final class MyRestaurantBlocInitial extends MyRestaurantBlocState {}
