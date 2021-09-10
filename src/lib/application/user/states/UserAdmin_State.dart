import 'package:equatable/equatable.dart';
import 'package:mitane_frontend/domain/user/entity/UserModels.dart';

abstract class UserAdminState extends Equatable {
  const UserAdminState();

  @override
  List<Object> get props => [];
}

class UserAdminLoading extends UserAdminState {}

class UserAdminOperationSuccess extends UserAdminState {
  final Iterable<dynamic> users;

  UserAdminOperationSuccess([this.users = const []]);

  @override
  List<Object> get props => [users];
}

class UserAdminOperationFailure extends UserAdminState {}