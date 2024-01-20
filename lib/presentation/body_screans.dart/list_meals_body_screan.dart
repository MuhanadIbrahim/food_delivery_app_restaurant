import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';

import '../../custom_widget/menu_details_price_card.dart';
import '../../domain/meals.dart';
import '../../domain/restaurant.dart';
import '../blocs/authentication/authentication_bloc.dart';
import '../blocs/my_restaurant_bloc/my_restaurant_bloc_bloc.dart';

class ListMealsBodyScrean extends StatefulWidget {
  const ListMealsBodyScrean({super.key});

  @override
  State<ListMealsBodyScrean> createState() => _ListMealsBodyScreanState();
}

class _ListMealsBodyScreanState extends State<ListMealsBodyScrean> {
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
      body: allMeals.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: allMeals.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MenuDetailsPriceCard(
                    jpg: 'assets/dashboard_logo.jpg',
                    price: allMeals[index].price,
                    title: allMeals[index].name,
                    subtitle: allMeals[index].description,
                  ),
                );
              },
            ),
    );
  }
}
