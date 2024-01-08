import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:food_delivery_app_restaurant/presentation/blocs/add_meal/add_meal_bloc.dart';
import 'package:food_delivery_app_restaurant/presentation/blocs/my_restaurant_bloc/my_restaurant_bloc_bloc.dart';

import '../blocs/authentication/authentication_bloc.dart';
import '../body_screans.dart/add_meal_screan_body.dart';

class AddMealScrean extends StatelessWidget {
  const AddMealScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => MyRestaurantBlocBloc(
                myRestaurantRepository:
                    context.read<AuthenticationBloc>().restaurantRepository)),
        BlocProvider(
          create: (context) => AddMealBloc(
              restaurantRepository:
                  context.read<AuthenticationBloc>().restaurantRepository),
        )
      ],
      child: const AddMealScreanBody(),
    );
  }
}
