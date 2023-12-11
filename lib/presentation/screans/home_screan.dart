import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          )
        ],
      ),
    );
  }
}
