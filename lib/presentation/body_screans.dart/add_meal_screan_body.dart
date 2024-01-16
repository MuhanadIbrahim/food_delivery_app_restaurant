import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_app_restaurant/presentation/blocs/add_meal/add_meal_bloc.dart';
import 'package:food_delivery_app_restaurant/presentation/blocs/my_restaurant_bloc/my_restaurant_bloc_bloc.dart';

import '../../domain/meals.dart';
import '../../domain/restaurant.dart';
import '../blocs/authentication/authentication_bloc.dart';

class AddMealScreanBody extends StatefulWidget {
  const AddMealScreanBody({super.key});

  @override
  State<AddMealScreanBody> createState() => _AddMealScreanBodyState();
}

class _AddMealScreanBodyState extends State<AddMealScreanBody> {
  String? mealName;
  String? mealPrice;
  String? mealPicture;
  String? mealId;
  String? mealDescription;
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddMealBloc, MealState>(
      builder: (context, state) {
        return Form(
          key: formkey,
          child: Scaffold(
            backgroundColor: Colors.grey,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 28.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 10.w,
                            ),
                            SizedBox(
                              height: 40.h,
                              width: 40.w,
                              child: Image.asset(
                                'assets/restaurant_logo.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'restaurant name',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: 350.w,
                      child: Divider(
                        color: Colors.black,
                        thickness: 2.h,
                      )),
                  SizedBox(
                    height: 15.h,
                  ),
                  BlocBuilder<MyRestaurantBlocBloc, MyRestaurantBlocState>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () async {
                          final User? user = FirebaseAuth.instance.currentUser;
                          final String uid = user!.uid;
                          print("User UID: $uid");
                          if (formkey.currentState!.validate()) {
                            context
                                .read<MyRestaurantBlocBloc>()
                                .add(GetMyRestaurant(myRestaurantId: uid));
                            MyMeals meal = MyMeals.empty;
                            meal = meal.copyWith(
                                name: mealName,
                                id: mealId,
                                picture: mealPicture,
                                price: mealPrice,
                                description: mealDescription);
                            MyRestaurant myRestaurant = await context
                                .read<AuthenticationBloc>()
                                .restaurantRepository
                                .getMyRestaurant(uid);
                            context.read<AddMealBloc>().add(AddMealEvent(
                                addMeal: meal, restaurant: myRestaurant));
                            setState(() {});
                          }
                        },
                        child: BlocBuilder<AddMealBloc, MealState>(
                          builder: (context, state) {
                            if (state is MealAdding) {
                              return Container(
                                padding: EdgeInsets.all(10.r),
                                height: 80.h,
                                width: 340.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.black,
                                  ),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.black),
                                    ),
                                  ],
                                ),
                              );
                            }
                            if (state is MealAddedSuccessfluy) {
                              // Example with fluttertoast:
                              Fluttertoast.showToast(
                                msg: "Your Meal Added Successfluy",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            }
                            if (state is MealAddFailed) {
                              // Example with fluttertoast:
                              Fluttertoast.showToast(
                                msg: "Add Your Meal Failed",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            }
                            return Container(
                              padding: EdgeInsets.all(10.r),
                              height: 80.h,
                              width: 340.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                color: Colors.white,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.black,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Add new meal here',
                                    style: TextStyle(
                                        fontSize: 25.sp, color: Colors.black),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(13.r),
                    height: 500.h,
                    width: 370.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: Colors.white,
                      border: Border.all(
                        width: 2,
                        color: Colors.black,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.r),
                          height: 85.h,
                          width: 340.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: const Color(0xffCFB8FF),
                            border: Border.all(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'meal name',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15.sp),
                              ),
                              Container(
                                color: Colors.white,
                                height: 35.h,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'please Enter Your meal name';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    mealName = value;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 1.h, left: 1.w),
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter meal name',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 15.sp),
                                  ),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.r),
                          height: 85.h,
                          width: 340.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: const Color(0xffFEFFDD),
                            border: Border.all(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'meal price',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15.sp),
                              ),
                              Container(
                                color: Colors.white,
                                height: 35.h,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'please Enter price';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    mealPrice = value;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 1.h, left: 1.w),
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter meal price',
                                  ),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.r),
                          height: 85.h,
                          width: 340.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: const Color(0xffCFB8FF),
                            border: Border.all(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'meal picture',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15.sp),
                              ),
                              Container(
                                color: Colors.white,
                                height: 35.h,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ' please enter your url picture ';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    mealPicture = value;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 1.h, left: 1.w),
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter meal picture',
                                  ),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.r),
                          height: 85.h,
                          width: 340.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: const Color(0xffFEFFDD),
                            border: Border.all(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'meal id',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15.sp),
                              ),
                              Container(
                                color: Colors.white,
                                height: 35.h,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'please enter meal id';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    mealId = value;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 1.h, left: 1.w),
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter meal id',
                                  ),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.r),
                          height: 100.h,
                          width: 340.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: const Color(0xffCFB8FF),
                            border: Border.all(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'meal description',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15.sp),
                              ),
                              Container(
                                color: Colors.white,
                                height: 40.h,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'please enter meal description ';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    mealDescription = value;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 1.h, left: 1.w),
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter meal description',
                                  ),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
