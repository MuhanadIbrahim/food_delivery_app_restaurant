import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_restaurant/constanints.dart';

import '../blocs/sign_in/sign_in_bloc.dart';

class SignInScrean extends StatefulWidget {
  SignInScrean({super.key});

  @override
  State<SignInScrean> createState() => _SignInScreanState();
}

class _SignInScreanState extends State<SignInScrean> {
  String? email;

  String? password;

  GlobalKey<FormState> formkey = GlobalKey();

  bool signInRequired = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(left: 20.w, right: 20.w, top: 5.h, bottom: 5.h),
          child: Column(
            children: [
              SizedBox(
                height: 25.h,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 80.h,
                    width: 88.w,
                    child: Image.asset(
                      'assets/burble_logo.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text("Restaurant Dashboard",
                      style: TextStyle(
                        color: const Color(0xff4443FF),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 10.w, right: 10.w, top: 20.h, bottom: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 1.w, right: 5.w, top: 5.h, bottom: 12.h),
                      child: Text(
                        ' Sign In',
                        style: TextStyle(
                          color: const Color(0xFF202020),
                          fontSize: 20.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      'Became member ,you’ll get exlusive treatment from Restaurant Dashboard',
                      style: TextStyle(
                        color: const Color(0xFF939393),
                        fontSize: 12.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      'Email ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF202020),
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0.12.h,
                      ),
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Email';
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter aemail',
                      ),
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    Text(
                      'Password ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF202020),
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0.12.h,
                      ),
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your password';
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Your password',
                      ),
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    !signInRequired
                        ? InkWell(
                            onTap: () {
                              if (formkey.currentState!.validate()) {
                                context.read<SignInBloc>().add(SignInRequired(
                                    email.toString(), password.toString()));
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: const Color(0xff4443FF),
                              ),
                              width: double.infinity,
                              height: 48.h,
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 8.h),
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      height: 0.12.h,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const CircularProgressIndicator(),
                    SizedBox(
                      height: 28.h,
                    ),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Forget your password?',
                              style: TextStyle(
                                color: const Color(0xFF939393),
                                fontSize: 12.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                height: 0.14,
                              ),
                            ),
                            TextSpan(
                              text: ' Rest password',
                              style: TextStyle(
                                color: const Color(0xFF7271FF),
                                fontSize: 12.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
