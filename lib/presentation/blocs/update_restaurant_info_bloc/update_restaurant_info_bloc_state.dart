part of 'update_restaurant_info_bloc_bloc.dart';

sealed class UpdateRestaurantInfoState extends Equatable {
  const UpdateRestaurantInfoState();

  @override
  List<Object> get props => [];
}

final class UpdateRestaurantInfoBlocInitial extends UpdateRestaurantInfoState {}
