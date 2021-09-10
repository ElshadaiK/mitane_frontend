import 'package:equatable/equatable.dart';
import 'package:mitane_frontend/domain/user/entity/user_models.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserAdminLoading extends UserState {}

class UserAdminOperationSuccess extends UserState {
  final Iterable<dynamic> users;

  UserAdminOperationSuccess([this.users = const []]);

  @override
  List<Object> get props => [users];
}

class UserAdminOperationFailure extends UserState {}
