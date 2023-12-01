import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_app_restaurant/domain/restaurant.dart';

abstract class RestaurantRepository {
  Stream<User?> get user;

  Future<MyRestaurant> signUp(MyRestaurant restaurant, String password);

  Future<bool> signIn(String email, String password);

  Future<void> logOut();

  Future<void> resetPassword(String email);

  Future<void> setRestaurantData(MyRestaurant restaurant);

  Future<MyRestaurant> getMyRestaurant(String myRestaurantId);

  Future<String> uploadPicture(String file, String restaurantId);
}
