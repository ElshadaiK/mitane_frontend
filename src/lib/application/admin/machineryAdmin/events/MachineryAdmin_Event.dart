import 'package:equatable/equatable.dart';
import 'package:mitane_frontend/domain/admin/machineryAdmin/entity/MachineryAdmin.dart';

abstract class MachineryAdminEvent extends Equatable {
  const MachineryAdminEvent();
}

class MachineryAdminLoad extends MachineryAdminEvent {
  const MachineryAdminLoad();

  @override
  List<Object> get props => [];
}

class MachineryAdminCreate extends MachineryAdminEvent {
  final Machinery machinery;

  const MachineryAdminCreate(this.machinery);

  @override
  List<Object> get props => [machinery];

  @override
  String toString() => 'User Created {User: $machinery}';
}

class MachineryAdminUpdate extends MachineryAdminEvent {
  final Machinery machinery;

  const MachineryAdminUpdate(this.machinery);

  @override
  List<Object> get props => [machinery];

  @override
  String toString() => 'User Updated {User: $machinery}';
}

class MachineryAdminDelete extends MachineryAdminEvent {
  final String id;

  const MachineryAdminDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'User Deleted {User Id: $id}';
}