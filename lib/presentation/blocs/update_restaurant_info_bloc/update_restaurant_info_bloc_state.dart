part of 'update_restaurant_info_bloc_bloc.dart';

sealed class UpdateRestaurantInfoState extends Equatable {
  const UpdateRestaurantInfoState();

  @override
  List<Object> get props => [];
}

final class UpdateRestaurantInfoBlocInitial extends UpdateRestaurantInfoState {}

class UploadPictureFailure extends UpdateRestaurantInfoState {}

class UploadPictureLoading extends UpdateRestaurantInfoState {}

class UploadPictureSuccess extends UpdateRestaurantInfoState {
  final String restaurantImage;
  const UploadPictureSuccess(
    this.restaurantImage,
  );

  @override
  List<Object> get props => [restaurantImage];
}
