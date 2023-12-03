part of 'update_restaurant_info_bloc_bloc.dart';

abstract class UpdateRestaurantInfoEvent extends Equatable {
  const UpdateRestaurantInfoEvent();

  @override
  List<Object> get props => [];
}

class UploadPicture extends UpdateRestaurantInfoEvent {
  final String file;
  final String restaurantId;

  const UploadPicture(this.file, this.restaurantId);

  @override
  List<Object> get props => [file, restaurantId];
}
