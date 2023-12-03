part of 'update_restaurant_info_bloc_bloc.dart';

abstract class UpdateUserInfoEvent extends Equatable {
  const UpdateUserInfoEvent();

  @override
  List<Object> get props => [];
}

class UploadPicture extends UpdateUserInfoEvent {
  final String file;
  final String restaurantId;

  const UploadPicture(this.file, this.restaurantId);

  @override
  List<Object> get props => [file, restaurantId];
}
