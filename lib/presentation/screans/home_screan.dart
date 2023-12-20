import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_restaurant/constanints.dart';

class HomeScrean extends StatelessWidget {
  const HomeScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
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
                DropdownButton(
                    dropdownColor: Colors.black, items: [], onChanged: null),
              ],
            ),
          ),
          Container(
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
                      icon: Icon(Icons.arrow_downward, color: Colors.black),
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
                      icon: Icon(Icons.arrow_upward, color: Colors.black),
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
                            icon:
                                Icon(Icons.arrow_downward, color: Colors.black),
                            onPressed: () {
                              // Add your onPressed functionality here
                            },
                          ),
                        ],
                      )
                    ],
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
                              'Meals Request',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              '23',
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
                                '23 meals in the menu',
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
