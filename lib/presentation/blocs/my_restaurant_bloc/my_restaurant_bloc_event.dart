part of 'my_restaurant_bloc_bloc.dart';

abstract class MyRestaurantBlocEvent extends Equatable {
  const MyRestaurantBlocEvent();

  @override
  List<Object> get props => [];
}

class GetMyRestaurant extends MyRestaurantBlocEvent {
  final String myRestaurantId;

  const GetMyRestaurant({required this.myRestaurantId});

  @override
  List<Object> get props => [myRestaurantId];
}










