import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constanints.dart';
import '../../domain/restaurant.dart';
import '../blocs/sign_up/sign_up_bloc.dart';

class SignUpBodyScrean extends StatefulWidget {
  const SignUpBodyScrean({super.key});

  @override
  State<SignUpBodyScrean> createState() => _SignUpBodyScreanState();
}

class _SignUpBodyScreanState extends State<SignUpBodyScrean> {
  String? email;

  String? password;

  String? name;

  String? description;

  int? phoneNumber;

  String? picture;

  GlobalKey<FormState> formkey = GlobalKey();

  bool signInRequired = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          setState(() {
            signInRequired = false;
            Navigator.of(context).pushNamed(ksignInScrean);
          });
        } else if (state is SignUpProcess) {
          setState(() {
            signInRequired = true;
          });
        } else if (state is SignUpFailure) {
          setState(() {
            signInRequired = false;
          });
        }
      },
      child: Scaffold(
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: 5.h, bottom: 5.h),
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
                            ' Create an Account',
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
                          height: 25.h,
                        ),
                        Text(
                          'Full Name ',
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
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            name = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please fill this field';
                            } else if (value.length > 30) {
                              return 'name too long';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your full name',
                          ),
                        ),
                        SizedBox(
                          height: 28.h,
                        ),
                        Text(
                          'Full Image URL ',
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
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            picture = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please fill this field';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter image URL',
                          ),
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        Text(
                          'Full Phone Number ',
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
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            phoneNumber = int.parse(value);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please fill this field';
                            } else if (value.length > 15) {
                              return 'phone number too long';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your phone number',
                          ),
                        ),
                        SizedBox(
                          height: 28.h,
                        ),
                        Text(
                          'Full description ',
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
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            description = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please fill this field';
                            } else if (value.length > 100) {
                              return 'description too long';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your full description',
                          ),
                        ),
                        SizedBox(
                          height: 28.h,
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
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            email = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your aemail';
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
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            password = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your a password';
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Create a password',
                          ),
                        ),
                        SizedBox(
                          height: 28.h,
                        ),
                        !signInRequired
                            ? InkWell(
                                onTap: () {
                                  if (formkey.currentState!.validate()) {
                                    MyRestaurant myRestaurant =
                                        MyRestaurant.empty;
                                    myRestaurant = myRestaurant.copyWith(
                                        picture: picture,
                                        phoneNumber: phoneNumber,
                                        description: description,
                                        email: email,
                                        name: name);
                                    setState(() {
                                      context.read<SignUpBloc>().add(
                                          SignUpRequired(myRestaurant,
                                              password.toString()));
                                    });
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
                                        'Create an Account',
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
                            : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: const Color(0xff4443FF),
                                ),
                                width: double.infinity,
                                height: 48.h,
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 8.h),
                                    child: const CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 28.h,
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, ksignInScrean),
                          child: Center(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Already have an account?',
                                    style: TextStyle(
                                      color: const Color(0xFF939393),
                                      fontSize: 12.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                      height: 0.14,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' log in',
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
