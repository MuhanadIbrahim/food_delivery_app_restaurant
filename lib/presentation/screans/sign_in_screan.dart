import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:food_delivery_app_restaurant/presentation/blocs/my_restaurant_bloc/my_restaurant_bloc_bloc.dart';

import '../blocs/authentication/authentication_bloc.dart';
import '../blocs/sign_in/sign_in_bloc.dart';
import '../blocs/update_restaurant_info_bloc/update_restaurant_info_bloc_bloc.dart';
import '../body_screans.dart/sign_in_body_screan.dart';

class SignInScrean extends StatefulWidget {
  SignInScrean({super.key});

  @override
  State<SignInScrean> createState() => _SignInScreanState();
}

class _SignInScreanState extends State<SignInScrean> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInBloc(
              restaurantRepository:
                  context.read<AuthenticationBloc>().restaurantRepository),
        ),
        BlocProvider(
          create: (context) => UpdateRestaurantInfoBloc(
              restaurantRepository:
                  context.read<AuthenticationBloc>().restaurantRepository),
        ),
        BlocProvider(
          create: (context) => MyRestaurantBlocBloc(
              myRestaurantRepository:
                  context.read<AuthenticationBloc>().restaurantRepository)
            ..add(GetMyRestaurant(
                myRestaurantId:
                    context.read<AuthenticationBloc>().state.user!.uid)),
        )
      ],
      child: const SignInBodyScrean(),
    );
  }
}
