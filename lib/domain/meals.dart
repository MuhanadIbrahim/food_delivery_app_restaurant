import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MyMeals extends Equatable {
  final String name;

  final double price;
  String? picture;
  final String id;
  final String description;

  MyMeals(
      {required this.name,
      required this.price,
      required this.id,
      required this.description,
      this.picture});

  static final empty =
      MyMeals(name: '', price: 0, id: '', description: '', picture: '');

  MyMeals copyWith({
    String? name,
    bool? available,
    double? price,
    String? picture,
    String? id,
    String? description,
  }) {
    return MyMeals(
      name: name ?? this.name,
      price: price ?? this.price,
      id: id ?? this.id,
      description: description ?? this.description,
    );
  }

  factory MyMeals.fromMap(Object? object) {
    final data = object as Map<String, dynamic>;
    return MyMeals(
        id: data['id'] as String,
        name: data['name'] as String,
        description: data['description'] as String,
        price: data['price'] as double,
        picture: data['picture'] as String);
  }

  Map<String, Object?> toDocument(Object? data) {
    return {
      'id': id,
      'price': price,
      'name': name,
      'description': description,
      'picture': picture
    };
  }

  bool get isEmpty => this == MyMeals.empty;

  bool get isNotEmpty => this != MyMeals.empty;

  @override
  List<Object?> get props => [
        name,
        price,
        picture ?? '',
        id,
        description,
      ];
}
