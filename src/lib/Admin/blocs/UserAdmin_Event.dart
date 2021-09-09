import 'package:equatable/equatable.dart';
import 'package:mitane_frontend/Admin/models/User.dart';

abstract class UserAdminEvent extends Equatable {
  const UserAdminEvent();
}

class UserAdminLoad extends UserAdminEvent {
  const UserAdminLoad();

  @override
  List<Object> get props => [];
}

class UserAdminCreate extends UserAdminEvent {
  final User user;

  const UserAdminCreate(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'User Created {User: $user}';
}

class UserAdminUpdate extends UserAdminEvent {
  final User user;

  const UserAdminUpdate(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'User Updated {User: $user}';
}

class UserAdminDelete extends UserAdminEvent {
  final int id;

  const UserAdminDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'User Deleted {User Id: $id}';
}