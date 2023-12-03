import 'package:equatable/equatable.dart';

class MyMeals extends Equatable {
  final String name;
  final bool available;
  final double price;
  String? picture;
  final String id;
  final String description;

  MyMeals(
      {required this.name,
      required this.available,
      required this.price,
      required this.id,
      required this.description,
      this.picture});

  static final empty =
      MyMeals(name: '', available: false, price: 0, id: '', description: '');

  MyMeals copyWith(
      {String? name,
      bool? available,
      double? price,
      String? picture,
      String? id,
      String? description}) {
    return MyMeals(
        name: name ?? this.name,
        available: available ?? this.available,
        price: price ?? this.price,
        id: id ?? this.id,
        description: description ?? this.description);
  }

  bool get isEmpty => this == MyMeals.empty;

  bool get isNotEmpty => this != MyMeals.empty;

  @override
  // TODO: implement props
  List<Object?> get props =>
      [name, available, price, picture ?? '', id, description];
}
