import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_meals_event.dart';
part 'get_meals_state.dart';

class GetMealsBloc extends Bloc<GetMealsEvent, GetMealsState> {
  GetMealsBloc() : super(GetMealsInitial()) {
    on<GetMealsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
