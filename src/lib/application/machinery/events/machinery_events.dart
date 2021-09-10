import 'package:equatable/equatable.dart';
import 'package:mitane_frontend/domain/machinery/entity/machinery_model.dart';

abstract class MachineryEvent extends Equatable {
  const MachineryEvent();
}

class MachineryAdminLoad extends MachineryEvent {
  const MachineryAdminLoad();

  @override
  List<Object> get props => [];
}

class MachineryAdminCreate extends MachineryEvent {
  final Machinery machinery;

  const MachineryAdminCreate(this.machinery);

  @override
  List<Object> get props => [machinery];

  @override
  String toString() => 'User Created {User: $machinery}';
}

class MachineryAdminUpdate extends MachineryEvent {
  final Machinery machinery;

  const MachineryAdminUpdate(this.machinery);

  @override
  List<Object> get props => [machinery];

  @override
  String toString() => 'User Updated {User: $machinery}';
}

class MachineryAdminDelete extends MachineryEvent {
  final String id;

  const MachineryAdminDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'User Deleted {User Id: $id}';
}
