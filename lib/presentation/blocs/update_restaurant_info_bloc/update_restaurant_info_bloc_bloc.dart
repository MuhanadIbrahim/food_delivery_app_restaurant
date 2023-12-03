import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_restaurant_info_bloc_event.dart';
part 'update_restaurant_info_bloc_state.dart';

class UpdateRestaurantInfoBloc
    extends Bloc<UpdateRestaurantInfoEvent, UpdateRestaurantInfoState> {
  UpdateRestaurantInfoBloc() : super(UpdateRestaurantInfoBlocInitial()) {
    on<UpdateRestaurantInfoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
