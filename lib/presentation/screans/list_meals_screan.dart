import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';

import '../blocs/authentication/authentication_bloc.dart';
import '../blocs/my_restaurant_bloc/my_restaurant_bloc_bloc.dart';
import '../body_screans.dart/List_meals_body_screan.dart';

class ListMealsScrean extends StatelessWidget {
  const ListMealsScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyRestaurantBlocBloc(
          myRestaurantRepository:
              context.read<AuthenticationBloc>().restaurantRepository),
      child: const ListMealsBodyScrean(),
    );
  }
}
