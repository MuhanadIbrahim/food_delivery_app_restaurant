import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_all_restaurant_event.dart';
part 'get_all_restaurant_state.dart';

class GetAllRestaurantBloc extends Bloc<GetAllRestaurantEvent, GetAllRestaurantState> {
  GetAllRestaurantBloc() : super(GetAllRestaurantInitial()) {
    on<GetAllRestaurantEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
