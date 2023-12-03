import 'package:equatable/equatable.dart';

class MyMeals extends Equatable {
  final String name;
  final bool available;
  final double price;
  String? picture;
  final String id;
  final String description;
  final int requiredQuantity;

  MyMeals(
      {required this.name,
      required this.available,
      required this.price,
      required this.id,
      required this.description,
      required this.requiredQuantity,
      this.picture});

  static final empty = MyMeals(
      name: '',
      available: false,
      price: 0,
      id: '',
      description: '',
      requiredQuantity: 0);

  MyMeals copyWith({
    String? name,
    bool? available,
    double? price,
    String? picture,
    String? id,
    String? description,
    int? requiredQuantity,
  }) {
    return MyMeals(
      name: name ?? this.name,
      available: available ?? this.available,
      price: price ?? this.price,
      id: id ?? this.id,
      description: description ?? this.description,
      requiredQuantity: requiredQuantity ?? this.requiredQuantity,
    );
  }

  bool get isEmpty => this == MyMeals.empty;

  bool get isNotEmpty => this != MyMeals.empty;

  @override
  
  List<Object?> get props =>
      [name, available, price, picture ?? '', id, description,requiredQuantity];
}
