import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app_restaurant/data/restaurant_repository.dart';

import '../../../domain/meals.dart';
import '../../../domain/restaurant.dart';

part 'update_restaurant_info_bloc_event.dart';
part 'update_restaurant_info_bloc_state.dart';

class UpdateRestaurantInfoBloc
    extends Bloc<UpdateRestaurantInfoEvent, UpdateRestaurantInfoState> {
  final RestaurantRepository _restaurantRepository;
  UpdateRestaurantInfoBloc({required RestaurantRepository restaurantRepository})
      : _restaurantRepository = restaurantRepository,
        super(UpdateRestaurantInfoBlocInitial()) {
    on<UploadPicture>((event, emit) async {
      emit(UploadPictureLoading());
      try {
        String restaurantImage = await _restaurantRepository.uploadPicture(
            event.file, event.restaurantId);
        emit(UploadPictureSuccess(restaurantImage));
      } catch (e) {
        emit(UploadPictureFailure());
      }
    });

    on<AddMeal>((event, emit) async {
      
    });
  }
}
