import 'package:cloud_firestore/cloud_firestore.dart';
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

  factory MyMeals.fromMap(Object? object) {
    final data = object as Map<String, dynamic>;
    return MyMeals(
        id: data['id'] as String,
        name: data['name'] as String ,
        description: data['description'] as String,
        price: data['price'] as double,
        available: data['available'] as bool,
        requiredQuantity: data['requiredQuantity'] as int,
        picture: data['picture'] as String );
  }
  bool get isEmpty => this == MyMeals.empty;

  bool get isNotEmpty => this != MyMeals.empty;

  @override
  List<Object?> get props => [
        name,
        available,
        price,
        picture ?? '',
        id,
        description,
        requiredQuantity
      ];
}
