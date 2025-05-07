import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

class UserModel {
  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.id,

})

  @freezed
  final firstName;
  final lastName;
  final email;
  final id;
}