import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_app_restaurant/data/restaurant_repository.dart';
import 'package:food_delivery_app_restaurant/domain/restaurant.dart';

class FirebaseRestaurantRepository implements RestaurantRepository {
  @override
  Future<MyRestaurant> signUp(MyRestaurant restaurant, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<bool> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<MyRestaurant> getMyRestaurant(String myRestaurantId) {
    // TODO: implement getMyRestaurant
    throw UnimplementedError();
  }

  @override
  Future<void> setRestaurantData(MyRestaurant restaurant) {
    // TODO: implement setRestaurantData
    throw UnimplementedError();
  }

  @override
  // TODO: implement user
  Stream<User?> get user => throw UnimplementedError();

  @override
  Future<String> uploadPicture(String file, String restaurantId) {
    // TODO: implement uploadPicture
    throw UnimplementedError();
  }
}
