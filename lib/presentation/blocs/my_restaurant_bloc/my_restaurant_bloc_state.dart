part of 'my_restaurant_bloc_bloc.dart';

enum MyRestaurantStatus { success, loading, failure }

sealed class MyRestaurantBlocState extends Equatable {
  final MyRestaurantStatus status;

  final MyRestaurant? restaurant;

  const MyRestaurantBlocState._(
      {this.status = MyRestaurantStatus.loading, this.restaurant});

  const MyRestaurantBlocState.loading() : this._();

  const MyRestaurantBlocState.success(MyRestaurant restaurant)
      : this._(status: MyRestaurantStatus.success, restaurant: restaurant);

  const MyRestaurantBlocState.failure()
      : this._(
          status: MyRestaurantStatus.failure,
        );

  @override
  List<Object?> get props => [status, restaurant];
}
