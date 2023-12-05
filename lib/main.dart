import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
    return MaterialApp(home: SignUpScrean());
  }
}

class WelcomeScrean extends StatelessWidget {
  const WelcomeScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
