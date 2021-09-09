import 'package:equatable/equatable.dart';
import 'package:mitane_frontend/Admin/models/User.dart';

abstract class UserAdminState extends Equatable {
  const UserAdminState();

  @override
  List<Object> get props => [];
}

class UserAdminLoading extends UserAdminState {}

class UserAdminOperationSuccess extends UserAdminState {
  final Iterable<User> users;

  UserAdminOperationSuccess([this.users = const []]);

  @override
  List<Object> get props => [users];
}

class UserOperationFailure extends UserAdminState {}