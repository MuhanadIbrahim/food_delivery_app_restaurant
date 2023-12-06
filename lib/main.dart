import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_delivery_app_restaurant/constanints.dart';
import 'package:food_delivery_app_restaurant/presentation/screans/sign_in_screan.dart';
import 'package:food_delivery_app_restaurant/presentation/screans/sign_up_screan.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      ksignUpScrean: (context) => SignUpScrean(),
      ksignInScrean: (context) => SignInScrean(),
    }, home: SignUpScrean());
  }
}
