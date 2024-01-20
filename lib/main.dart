import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_restaurant/constanints.dart';
import 'package:food_delivery_app_restaurant/data/firebase_restaurant_repository.dart';
import 'package:food_delivery_app_restaurant/data/restaurant_repository.dart';
import 'package:food_delivery_app_restaurant/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:food_delivery_app_restaurant/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:food_delivery_app_restaurant/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:food_delivery_app_restaurant/presentation/screans/add_meals_screan.dart';
import 'package:food_delivery_app_restaurant/presentation/screans/home_screan.dart';
import 'package:food_delivery_app_restaurant/presentation/screans/list_meals_screan.dart';
import 'package:food_delivery_app_restaurant/presentation/screans/sign_in_screan.dart';
import 'package:food_delivery_app_restaurant/presentation/screans/sign_up_screan.dart';
import 'package:food_delivery_app_restaurant/simple_bloc_observer.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(DevicePreview(
      builder: ((context) => MyApp(FirebaseRestaurantRepository()))));
}

class MyApp extends StatefulWidget {
  final RestaurantRepository restaurantRepository;
  const MyApp(this.restaurantRepository, {super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<AuthenticationBloc>(
          create: (_) => AuthenticationBloc(
              myRestaurantRepository: widget.restaurantRepository),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(
              restaurantRepository:
                  context.read<AuthenticationBloc>().restaurantRepository),
        ),
        BlocProvider(
          create: (context) => SignInBloc(
              restaurantRepository:
                  context.read<AuthenticationBloc>().restaurantRepository),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            builder: DevicePreview.appBuilder,
            routes: {
              ksignUpScrean: (context) => const SignUpScrean(),
              ksignInScrean: (context) => SignInScrean(),
              khomeScrean: (context) => const HomeScrean(),
              kaddMealsScrean: (context) => const AddMealScrean(),
              klistmealsScrean: (context) => const ListMealsScrean()
            },

            debugShowCheckedModeBanner: false,
            title: 'First Method',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: SignUpScrean(),
          );
        },
        // child:  SignUpScrean(),
      ),
    );
  }
}
