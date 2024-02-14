part of 'get_all_restaurant_bloc.dart';

sealed class GetAllRestaurantState extends Equatable {
  const GetAllRestaurantState();
  
  @override
  List<Object> get props => [];
}

final class GetAllRestaurantInitial extends GetAllRestaurantState {}
