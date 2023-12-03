import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app_restaurant/domain/restaurant.dart';

import 'my_restaurant_bloc_bloc.dart';

part 'my_restaurant_bloc_event.dart';
part 'my_restaurant_bloc_state.dart';

class MyRestaurantBlocBloc extends Bloc<MyRestaurantBlocEvent, MyRestaurantBlocState> {
  MyRestaurantBlocBloc() : super(MyRestaurantBlocInitial()) {
    on<MyRestaurantBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
