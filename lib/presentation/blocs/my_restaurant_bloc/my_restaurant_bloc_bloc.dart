import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_restaurant_bloc_event.dart';
part 'my_restaurant_bloc_state.dart';

class MyRestaurantBlocBloc extends Bloc<MyRestaurantBlocEvent, MyRestaurantBlocState> {
  MyRestaurantBlocBloc() : super(MyRestaurantBlocInitial()) {
    on<MyRestaurantBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
