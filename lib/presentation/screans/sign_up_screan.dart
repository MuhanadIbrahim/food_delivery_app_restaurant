import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_restaurant/constanints.dart';
import 'package:food_delivery_app_restaurant/domain/restaurant.dart';

import '../blocs/authentication/authentication_bloc.dart';
import '../blocs/sign_up/sign_up_bloc.dart';
import '../body_screans.dart/sign_up_body_screan.dart';

class SignUpScrean extends StatefulWidget {
  const SignUpScrean({super.key});

  @override
  State<SignUpScrean> createState() => _SignUpScreanState();
}

class _SignUpScreanState extends State<SignUpScrean> {
  String? email;

  String? password;

  String? name;

  GlobalKey<FormState> formkey = GlobalKey();

  bool signInRequired = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(
          restaurantRepository:
              context.read<AuthenticationBloc>().restaurantRepository),
      child: const SignUpBodyScrean(),
    );
  }
}
