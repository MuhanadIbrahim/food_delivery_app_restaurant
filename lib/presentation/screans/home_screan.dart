import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_restaurant/constanints.dart';
import 'package:food_delivery_app_restaurant/domain/meals.dart';

import '../../domain/restaurant.dart';
import '../blocs/authentication/authentication_bloc.dart';
import '../blocs/my_restaurant_bloc/my_restaurant_bloc_bloc.dart';

class HomeScrean extends StatefulWidget {
  const HomeScrean({super.key});

  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyRestaurantBlocBloc(
          myRestaurantRepository:
              context.read<AuthenticationBloc>().restaurantRepository),
      child: const HomeScreanBody(),
    );
  }
}

class HomeScreanBody extends StatefulWidget {
  const HomeScreanBody({super.key});

  @override
  State<HomeScreanBody> createState() => _HomeScreanBodyState();
}

class _HomeScreanBodyState extends State<HomeScreanBody> {
  List<MyMeals> allMeals = [];
  String restaurantName = '';
  void initState() {
    super.initState();

    final User? user = FirebaseAuth.instance.currentUser;
    final String uid = user!.uid;
    print("User UID: $uid");

    context
        .read<MyRestaurantBlocBloc>()
        .add(GetMyRestaurant(myRestaurantId: uid));

    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      final String uid = user!.uid;
      MyRestaurant myRestaurant = await context
          .read<AuthenticationBloc>()
          .restaurantRepository
          .getMyRestaurant(uid);
      restaurantName = myRestaurant.name;

      allMeals = await context
          .read<AuthenticationBloc>()
          .restaurantRepository
          .getAllMeals(myRestaurant);

      setState(() {}); // Trigger a rebuild after data is fetched
    } catch (error) {
      // Handle errors appropriately
      print("Error fetching data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
       body:
      // allMeals.isEmpty
      //     ? const Center(
      //         child: CircularProgressIndicator(),
      //       )
      //     :
       Column(
              children: [
                SizedBox(
                  height: 28.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<MyRestaurantBlocBloc, MyRestaurantBlocState>(
                        builder: (context, state) {
                          return Row(
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
                                '$restaurantName restaurant',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          );
                        },
                      ),
                      DropdownButton(
                          dropdownColor: Colors.black,
                          items: [],
                          onChanged: null),
                    ],
                  ),
                ),
                SizedBox(
                    width: double.infinity,
                    child: Divider(
                      color: Colors.black,
                      thickness: 2.h,
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'Meals Request',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            '23',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '-5,09%',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_downward,
                                color: Colors.black),
                            onPressed: () {
                              // Add your onPressed functionality here
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Meals Request',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '23',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '+5,1%',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_upward,
                                color: Colors.black),
                            onPressed: () {
                              // Add your onPressed functionality here
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(13.r),
                    height: 80.h,
                    width: double.infinity.w,
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
                        Text(
                          'Region 1',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  'Meals Request',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  '23',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '-5,09%',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.arrow_downward,
                                      color: Colors.black),
                                  onPressed: () {
                                    // Add your onPressed functionality here
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, klistmealsScrean);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.r),
                            height: 80.h,
                            width: 340.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: const Color(0xffCFB8FF),
                              border: Border.all(
                                width: 2,
                                color: Colors.black,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      'List Of Meals',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                      '${allMeals.length}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '-5,09%',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.arrow_downward,
                                          size: 19.sp, color: Colors.black),
                                      onPressed: () {
                                        // Add your onPressed functionality here
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, kaddMealsScrean);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.r),
                            height: 80.h,
                            width: 340.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: const Color(0xffFEFFDD),
                              border: Border.all(
                                width: 2,
                                color: Colors.black,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      'Add Meals',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                      '${allMeals.length} in the menu',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '-5,09%',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.arrow_downward,
                                          size: 19.sp, color: Colors.black),
                                      onPressed: () {
                                        // Add your onPressed functionality here
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.r),
                          height: 80.h,
                          width: 340.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: const Color(0xffCFB8FF),
                            border: Border.all(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    'Chat with Client',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    '23 Unreaded',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '-5,09% respone',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  IconButton(
                                    iconSize: 5.sp,
                                    padding: EdgeInsets.all(2.r),
                                    icon: Icon(Icons.arrow_downward,
                                        size: 15.sp, color: Colors.black),
                                    onPressed: () {
                                      // Add your onPressed functionality here
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
