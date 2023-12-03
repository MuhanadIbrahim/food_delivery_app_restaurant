import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_app_restaurant/data/restaurant_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';


class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
      
  final RestaurantRepository restaurantRepository;
  late final StreamSubscription<User?> _userSubscription;

  AuthenticationBloc({required RestaurantRepository myRestaurantRepository})
      : restaurantRepository =  myRestaurantRepository,
        super(const AuthenticationState.unknown()) {
    _userSubscription = restaurantRepository.user.listen(
      (authUser) {
        add(AuthenticationUserChanged(authUser));
      },
    );
    on<AuthenticationUserChanged>((event, emit) {
      if (event.user != null) {
        emit(AuthenticationState.authenticated(event.user!));
      } else {
        emit(const AuthenticationState.unauthenticated());
      }
    });
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
