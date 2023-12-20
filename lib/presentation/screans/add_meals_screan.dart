import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddMealScrean extends StatelessWidget {
  const AddMealScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add new meal here',
                    style: TextStyle(fontSize: 25.sp, color: Colors.black),
                  )
                ],
              ),
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
                          style:
                              TextStyle(color: Colors.black, fontSize: 15.sp),
                        ),
                        Container(
                          color: Colors.white,
                          height: 35.h,
                          child: TextField(
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
                          style:
                              TextStyle(color: Colors.black, fontSize: 15.sp),
                        ),
                        Container(
                          color: Colors.white,
                          height: 35.h,
                          child: TextField(
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
                          style:
                              TextStyle(color: Colors.black, fontSize: 15.sp),
                        ),
                        Container(
                          color: Colors.white,
                          height: 35.h,
                          child: TextField(
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
                          style:
                              TextStyle(color: Colors.black, fontSize: 15.sp),
                        ),
                        Container(
                          color: Colors.white,
                          height: 35.h,
                          child: TextField(
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
                          style:
                              TextStyle(color: Colors.black, fontSize: 15.sp),
                        ),
                        Container(
                          color: Colors.white,
                          height: 40.h,
                          child: TextField(
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
    );
  }
}
