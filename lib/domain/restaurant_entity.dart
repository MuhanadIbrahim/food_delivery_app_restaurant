import 'package:equatable/equatable.dart';

class MyRestaurantEntity extends Equatable {
  final String name;
  final int phoneNumber;
  final String email;
  final String? picture;
  final String id;
  final String description;

  const MyRestaurantEntity({
    required this.description,
    required this.name,
    required this.phoneNumber,
    required this.email,
    this.picture,
    required this.id,
  });

  Map<String, Object?> toDocument() {
    return {
      'description': description,
      'id': id,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'picture': picture
    };
  }

  static MyRestaurantEntity fromDocument(Map<String, dynamic> doc) {
    return MyRestaurantEntity(
      id: doc['id'] as String,
      name: doc['name'] as String,
      phoneNumber: doc['phoneNumber'] as int,
      email: doc['email'] as String,
      picture: doc['picture'] as String?,
      description: doc['description'] as String,
    );
  }

  @override
  List<Object?> get props =>
      [id, name, phoneNumber, email, picture, description];

  @override
  String toString() {
    return '''UserEntity: {
        id: $id
        email: $email
        name: $name
        phoneNumber: $phoneNumber
        picture: $picture

      }''';
  }
}
