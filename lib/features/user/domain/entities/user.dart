import 'package:equatable/equatable.dart';

abstract class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.picture,
  });
  final String id;
  final String email;
  final String name;
  final String picture;

  @override
  List<Object?> get props => [id, email, name, picture];
}
