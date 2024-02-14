import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app_restaurant/domain/meals.dart';

part 'get_all_meals_event.dart';
part 'get_all_meals_state.dart';

class GetAllMealsBloc extends Bloc<GetAllMealsEvent, GetAllMealsState> {
  GetAllMealsBloc() : super(GetAllMealsInitial()) {
    on<GetAllMealsEvent>((event, emit) {
      try {
        
      } catch (e) {
        
      }
    });
  }
}
